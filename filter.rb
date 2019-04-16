require 'csv'
require 'pry'

#:encoding => 'ISO-8859-1'

# data_googleproducts = []
#
# #write all products in array
# googleproducts = CSV.read('original_csv/googlepro.csv', :encoding => 'ISO-8859-1', col_sep: "\t")
#   googleproducts.each do |row|
#     data_googleproducts << row
# end
#
#
# data_googleproducts.each do |product|
#
# end
#
#
# unique_ean_gtin_products = data_googleproducts.uniq do |s|
#    s[13]
# end
#
# # binding.pry
#
# #Write result to CSV file
# CSV.open('ready_csv/googleproducts_removed_duplicates', 'w') do |csv_object|
#   unique_ean_gtin_products.each do |row_array|
#     csv_object << row_array
#   end
# end

#-------------------------------------------------------------------------------

# array = [ "A", "B", "A", "C"]
#
# def find_duplicates
#     select.with_index do |e, i|
#       i
#       self.index(e)
#       i != self.index(e)
#     end
# end
#
# c = array.select.with_index do |e, i|
#   i != array.index(e)
# end
#
# p c

# array.select.with_index do |e, i|
#   i != a.index(e)
# end


nested_array = [ [1, "A", "@"], [2, "B", "#"], [3, "C", "&"],[4, "B", "%"], [5, "A", "*"] ]

# nested_array.select.with_index do |array, i| # Масиви і індекси
#   array.each do |e| #Проходимося по кожному з масивів
#     binding.pry
#       array = array.index(e) #Перевіряємо індекси в нашому вкладеному масиві
#   end
# end

# nested_array.select.with_index do |array, i| # Масиви і індекси
#   binding.pry
#   array[1] != array.index(array[1])
# end


# result = nested_array.group_by(
#     nested_array.each do |arr|
#     arr.each do |a|
#       a[1]
#     end
# end
# ).values.select{ |v| v.size > 1 }
# p result

result = nested_array.group_by{|a| a[1]}.values.select{ |v| v.size > 1 }
p result


# p nested_array.group_by{|x,y,z,c,v,b,n,m,a,s,d,f,g| y}.select{|x,y|y.count>1}.values.flatten(1)

# data_with_duplicates = data_googleproducts.group_by{|v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11,v12,v13| v13}.values.select{ |v| v.size > 1 }.flatten(1)
# c = data_with_duplicates.unshift(data_googleproducts[0])

# data_with_duplicates = data_googleproducts.group_by{|v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11,v12,v13| v13}
# .select{|v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11,v12,v13| v4.count > 1}
# .values.flatten(1)

# arr = [ ["A", 2, 7], ["A", 1, 5] ,["A", 3, 7], ["A", 9, 7], ["G", 2, 8], ["V", 2, 7] ]
# a = arr.group_by{|v1| v1[0]}.values.select{ |v| v.size > 1}.flatten(1)
# p a
