require 'csv'
require 'pry'

ean_or_gtin = 13
id = 0

data_googleproducts = []

#Write all products in array
googleproducts = CSV.read('original_csv/googleproducts_new.csv', col_sep: "\t", :encoding => 'ISO-8859-1')
  googleproducts.each do |row|
    data_googleproducts << row
end

#Make coorect ean/gtin
data_googleproducts[1..-1].map do |row|
  if(row[ean_or_gtin] == nil)
      'All Fine'
  elsif(row[ean_or_gtin].include?(" "))
     s = row[ean_or_gtin].delete(' ')
     row[ean_or_gtin] = s
  end

  without_characters = row[ean_or_gtin].gsub(/[^\d]/, '') unless row[ean_or_gtin].nil?
  row[ean_or_gtin] = without_characters
  # row[ean_or_gtin] !~ /\D/ ? true : data_googleproducts.delete(row)
end

#Delete duplications id and ean/gtin
unique_id_products = data_googleproducts.uniq { |s| s[id] }
unique_ean_gtin_products = unique_id_products.uniq { |s| s[ean_or_gtin] }

#Write removed duplication to CSV file
CSV.open('ready_csv/removed_duplicates.csv', 'w') do |csv_object|
  unique_ean_gtin_products.each do |row_array|
    csv_object << row_array
  end
end

data_with_ean_gtin_duplicates = data_googleproducts.group_by{|v1| v1[ean_or_gtin]}.values.select{ |v| v.size > 1 }.flatten(1)
array_ean_gtin_duplicates = data_with_ean_gtin_duplicates.unshift(data_googleproducts[0])

#Write duplications to CSV file
count_empty_ean_gtin = 0
CSV.open('ready_csv/with_ean_gtin_duplicates.csv', 'w') do |csv_duplicate_object|
  array_ean_gtin_duplicates.each do |row_duplicate_array|
    csv_duplicate_object << row_duplicate_array
    count_empty_ean_gtin += 1 if row_duplicate_array[ean_or_gtin].nil?
  end
end

data_with_id_duplicates = data_googleproducts.group_by{|v1| v1[id]}.values.select{ |v| v.size > 1 }.flatten(1)
array_id_duplicates = data_with_id_duplicates.unshift(data_googleproducts[0])

count_empty_id = 0
CSV.open('ready_csv/with_id_duplicates.csv', 'w') do |csv_duplicate_object|
  array_id_duplicates.each do |row_duplicate_array|
    csv_duplicate_object << row_duplicate_array
    count_empty_id += 1 if row_duplicate_array[id].nil?
  end
end

p "Count of empty ean/gtin #{count_empty_ean_gtin}"
p "Count of epmty ids #{count_empty_id}"
