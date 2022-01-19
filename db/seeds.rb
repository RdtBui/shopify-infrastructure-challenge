# ========================================
# | Item
# ========================================
Item.destroy_all

Item.create([
              # January
              {
                title: 'Sample item title from seed.rb',
                summary: 'Some summary',
                sku: 'SOME-SKU',
                price: 99.99,
                quantity: 4,
                brand: 'Sample brand',
                category: 'Sample category',
                created_at: DateTime.new(2022, 1, 18)
              }
            ])

p "Created #{Item.count} sample items."

# ========================================
# | Year 2021 logs
# ========================================
Log.destroy_all

Log.create([
             # 1. January
             {
               item_title: 'Chicken thighs 500 g',
               item_sku: 'POK-POK-P000K',
               item_price: 8.99,
               item_quantity: 77,
               item_brand: "Richard's Farm",
               item_category: 'food',
               created_at: DateTime.new(2021, 1, 10)
             },
             # 2. February
             {
               item_title: 'Liqui-Gels, 200 mg Ibuprofen',
               item_sku: 'B-132-14432-332',
               item_price: 14.97,
               item_quantity: 9,
               item_brand: 'Advil',
               item_category: 'health',
               created_at: DateTime.new(2021, 2, 23)
             },
             {
               item_title: 'Extra Strength Acetaminophen, 500 mg',
               item_sku: 'K0F230KFK2FKF',
               item_price: 10.47,
               item_quantity: 4,
               item_brand: 'Tylenol',
               item_category: 'health',
               created_at: DateTime.new(2021, 2, 24)
             },
             # 3. March
             {
               item_title: 'Solution Comp Climbing Shoes',
               item_sku: '20Z',
               item_price: 185.00,
               item_quantity: 23,
               item_brand: 'La Sportiva',
               item_category: 'clothing',
               created_at: DateTime.new(2021, 3, 10)
             },
             {
               item_title: 'Solution Comp Climbing Shoes',
               item_sku: '20Z',
               item_price: 185.00,
               item_quantity: 4,
               item_brand: 'La Sportiva',
               item_category: 'clothing',
               created_at: DateTime.new(2021, 3, 14)
             },
             {
               item_title: 'Otaki Climbing Shoes',
               item_sku: '10T',
               item_price: 195.00,
               item_quantity: 33,
               item_brand: 'La Sportiva',
               item_category: 'clothing',
               created_at: DateTime.new(2021, 3, 28)
             },
             # 4. April
             {
               item_title: 'Patsy 68" Velvet Tuxedo Arm Sofa',
               item_sku: 'W8420398402332',
               item_price: 1499.99,
               item_quantity: 3,
               item_brand: 'Etta Avenue',
               item_category: 'furniture',
               created_at: DateTime.new(2021, 4, 10)
             },
             {
               item_title: 'Aventus Eau de Parfum, 100 mL',
               item_sku: '2432',
               item_price: 463.69,
               item_quantity: 10,
               item_brand: 'Creed',
               item_category: 'beauty',
               created_at: DateTime.new(2021, 4, 14)
             },
             {
               item_title: 'Sycomore Eau de Parfum, 200 mL',
               item_sku: 'G443333',
               item_price: 250.00,
               item_quantity: 5,
               item_brand: 'Chanel',
               item_category: 'beauty',
               created_at: DateTime.new(2021, 4, 18)
             },
             {
               item_title: 'Sycomore Eau de Parfum, 200 mL',
               item_sku: 'G443333',
               item_price: 250.00,
               item_quantity: 2,
               item_brand: 'Chanel',
               item_category: 'beauty',
               created_at: DateTime.new(2021, 4, 25)
             },
             # 5. May
             {
               item_title: 'Patsy 68" Velvet Tuxedo Arm Sofa',
               item_sku: 'W8420398402332',
               item_price: 1499.99,
               item_quantity: 1,
               item_brand: 'Etta Avenue',
               item_category: 'furniture',
               created_at: DateTime.new(2021, 5, 10)
             },
             {
               item_title: 'Otaki Climbing Shoes',
               item_sku: '10T',
               item_price: 195.00,
               item_quantity: 26,
               item_brand: 'La Sportiva',
               item_category: 'clothing',
               created_at: DateTime.new(2021, 5, 11)
             },
             {
               item_title: '100% Cacao Chocolate',
               item_sku: 'JJF2-23F-233F',
               item_price: 4.79,
               item_quantity: 50,
               item_brand: 'Lindt',
               item_category: 'food',
               created_at: DateTime.new(2021, 5, 18)
             },
             {
               item_title: '100% Cacao Chocolate',
               item_sku: 'JJF2-23F-233F',
               item_price: 4.79,
               item_quantity: 30,
               item_brand: 'Lindt',
               item_category: 'food',
               created_at: DateTime.new(2021, 5, 19)
             },
             {
               item_title: '100% Cacao Chocolate',
               item_sku: 'JJF2-23F-233F',
               item_price: 4.79,
               item_quantity: 46,
               item_brand: 'Lindt',
               item_category: 'food',
               created_at: DateTime.new(2021, 5, 23)
             },
             # 6. June
             {
               item_title: 'Chicken thighs 500 g',
               item_sku: 'POK-POK-P000K',
               item_price: 8.99,
               item_quantity: 30,
               item_brand: "Richard's Farm",
               item_category: 'food',
               created_at: DateTime.new(2021, 6, 10)
             },
             {
               item_title: '100% Cacao Chocolate',
               item_sku: 'JJF2-23F-233F',
               item_price: 4.79,
               item_quantity: 20,
               item_brand: 'Lindt',
               item_category: 'food',
               created_at: DateTime.new(2021, 6, 10)
             },
             {
               item_title: 'Chicken thighs 500 lbs',
               item_sku: 'POK-POK-P000K',
               item_price: 8.99,
               item_quantity: 223,
               item_brand: "Richard's Farm",
               item_category: 'food',
               created_at: DateTime.new(2021, 6, 12)
             },
             {
               item_title: 'The Little Book of Common Sense Investing, Hardcover',
               item_sku: '111940570',
               item_price: 20.70,
               item_quantity: 4,
               item_brand: 'John C. Bogle (Author)',
               item_category: 'book',
               created_at: DateTime.new(2021, 6, 15)
             },
             {
               item_title: 'The Little Book of Common Sense Investing, Hardcover',
               item_sku: '111940570',
               item_price: 20.70,
               item_quantity: 0,
               item_brand: 'John C. Bogle (Author)',
               item_category: 'book',
               created_at: DateTime.new(2021, 6, 15)
             },
             {
               item_title: 'The Little Book of Common Sense Investing, Hardcover',
               item_sku: '111940570',
               item_price: 20.70,
               item_quantity: 58,
               item_brand: 'John C. Bogle (Author)',
               item_category: 'book',
               created_at: DateTime.new(2021, 6, 29)
             },
             # 7. July
             {
               item_title: '3.3 ft Premium Double-Braided Nylon Lightning Cable',
               item_sku: '3454FE23F3F222',
               item_price: 16.99,
               item_quantity: 25,
               item_brand: 'Anker',
               item_category: 'electronic',
               created_at: DateTime.new(2021, 7, 3)
             },
             {
               item_title: 'Chicken thighs 500 lbs',
               item_sku: 'POK-POK-P000K',
               item_price: 8.99,
               item_quantity: 100,
               item_brand: "Richard's Farm",
               item_category: 'food',
               created_at: DateTime.new(2021, 7, 12)
             },
             {
               item_title: 'Chicken thighs 500 lbs',
               item_sku: 'POK-POK-P000K',
               item_price: 8.99,
               item_quantity: 43,
               item_brand: "Richard's Farm",
               item_category: 'food',
               created_at: DateTime.new(2021, 7, 12)
             },
             {
               item_title: 'Mushroom Cream Soup',
               item_sku: '13692349433-DWE',
               item_price: 2.79,
               item_quantity: 432,
               item_brand: "Campbell's",
               item_category: 'food',
               created_at: DateTime.new(2021, 7, 15)
             },
             {
               item_title: 'Mushroom Cream Soup',
               item_sku: '13692349433-DWE',
               item_price: 2.79,
               item_quantity: 303,
               item_brand: "Campbell's",
               item_category: 'food',
               created_at: DateTime.new(2021, 7, 15)
             },
             {
               item_title: 'Mushroom Cream Soup',
               item_sku: '13692349433-DWE',
               item_price: 2.79,
               item_quantity: 42,
               item_brand: "Campbell's",
               item_category: 'food',
               created_at: DateTime.new(2021, 7, 15)
             },
             {
               item_title: 'Mushroom Cream Soup',
               item_sku: '13692349433-DWE',
               item_price: 2.79,
               item_quantity: 92,
               item_brand: "Campbell's",
               item_category: 'food',
               created_at: DateTime.new(2021, 7, 27)
             },
             # 8. August
             {
               item_title: '3.3 ft Premium Double-Braided Nylon Lightning Cable',
               item_sku: '3454FE23F3F222',
               item_price: 16.99,
               item_quantity: 253,
               item_brand: 'Anker',
               item_category: 'electronic',
               created_at: DateTime.new(2021, 8, 3)
             },
             {
               item_title: 'Chicken thighs 500 lbs',
               item_sku: 'POK-POK-P000K',
               item_price: 8.99,
               item_quantity: 32,
               item_brand: "Richard's Farm",
               item_category: 'food',
               created_at: DateTime.new(2021, 8, 12)
             },
             {
               item_title: 'Chicken thighs 500 lbs',
               item_sku: 'POK-POK-P000K',
               item_price: 8.99,
               item_quantity: 23,
               item_brand: "Richard's Farm",
               item_category: 'food',
               created_at: DateTime.new(2021, 8, 12)
             },
             {
               item_title: 'Dry Dog Food',
               item_sku: '5282197',
               item_price: 12.99,
               item_quantity: 122,
               item_brand: 'Iams',
               item_category: 'pet',
               created_at: DateTime.new(2021, 8, 15)
             },
             {
               item_title: 'Dry Dog Food',
               item_sku: '5282197',
               item_price: 12.99,
               item_quantity: 59,
               item_brand: 'Iams',
               item_category: 'pet',
               created_at: DateTime.new(2021, 8, 17)
             },
             {
               item_title: 'Dry Dog Food',
               item_sku: '5282197',
               item_price: 12.99,
               item_quantity: 22,
               item_brand: 'Iams',
               item_category: 'pet',
               created_at: DateTime.new(2021, 8, 22)
             },
             {
               item_title: 'Harry Potter Wand',
               item_sku: 'HP-200002FJ005',
               item_price: 49.99,
               item_quantity: 2353,
               item_brand: 'Warner Bros',
               item_category: 'toy',
               created_at: DateTime.new(2021, 8, 27)
             },
             {
               item_title: 'Beyblade',
               item_sku: 'BEE20FJFE22',
               item_price: 12.99,
               item_quantity: 32,
               item_brand: 'Hasbro',
               item_category: 'toy',
               created_at: DateTime.new(2021, 8, 28)
             },
             # 9. September
             {
               item_title: '3.3 ft Premium Double-Braided Nylon Lightning Cable',
               item_sku: '3454FE23F3F222',
               item_price: 16.99,
               item_quantity: 89,
               item_brand: 'Anker',
               item_category: 'electronic',
               created_at: DateTime.new(2021, 9, 3)
             },
             {
               item_title: 'Chicken thighs 500 lbs',
               item_sku: 'POK-POK-P000K',
               item_price: 8.99,
               item_quantity: 289,
               item_brand: "Richard's Farm",
               item_category: 'food',
               created_at: DateTime.new(2021, 9, 12)
             },
             {
               item_title: 'Patsy 68" Velvet Tuxedo Arm Sofa',
               item_sku: 'W8420398402332',
               item_price: 1499.99,
               item_quantity: 1,
               item_brand: 'Etta Avenue',
               item_category: 'furniture',
               created_at: DateTime.new(2021, 9, 6)
             },
             {
               item_title: 'Liqui-Gels, 200 mg Ibuprofen',
               item_sku: 'B-132-14432-332',
               item_price: 14.97,
               item_quantity: 2833,
               item_brand: 'Advil',
               item_category: 'health',
               created_at: DateTime.new(2021, 9, 23)
             },
             {
               item_title: 'Dry Dog Food',
               item_sku: '5282197',
               item_price: 12.99,
               item_quantity: 16,
               item_brand: 'Iams',
               item_category: 'pet',
               created_at: DateTime.new(2021, 9, 17)
             },
             {
               item_title: 'Dry Dog Food',
               item_sku: '5282197',
               item_price: 12.99,
               item_quantity: 14,
               item_brand: 'Iams',
               item_category: 'pet',
               created_at: DateTime.new(2021, 9, 22)
             },
             {
               item_title: 'The Little Book of Common Sense Investing, Hardcover',
               item_sku: '111940570',
               item_price: 20.70,
               item_quantity: 0,
               item_brand: 'John C. Bogle (Author)',
               item_category: 'book',
               created_at: DateTime.new(2021, 9, 24)
             },
             {
               item_title: 'Otaki Climbing Shoes',
               item_sku: '10T',
               item_price: 195.00,
               item_quantity: 21,
               item_brand: 'La Sportiva',
               item_category: 'clothing',
               created_at: DateTime.new(2021, 5, 11)
             },
             {
               item_title: 'Beyblade',
               item_sku: 'BEE20FJFE22',
               item_price: 12.99,
               item_quantity: 5,
               item_brand: 'Hasbro',
               item_category: 'toy',
               created_at: DateTime.new(2021, 9, 30)
             },
             # 10. Ocotober
             {
               item_title: 'D3 Stainless Steel Saute Pan',
               item_sku: '3454FE23F3F222',
               item_price: 342.42,
               item_quantity: 125,
               item_brand: 'All-Clad',
               item_category: 'cooking',
               created_at: DateTime.new(2021, 10, 3)
             },
             {
               item_title: 'Chicken thighs 500 lbs',
               item_sku: 'POK-POK-P000K',
               item_price: 8.99,
               item_quantity: 198,
               item_brand: "Richard's Farm",
               item_category: 'food',
               created_at: DateTime.new(2021, 10, 12)
             },
             {
               item_title: 'Patsy 68" Velvet Tuxedo Arm Sofa',
               item_sku: 'W8420398402332',
               item_price: 1499.99,
               item_quantity: 0,
               item_brand: 'Etta Avenue',
               item_category: 'furniture',
               created_at: DateTime.new(2021, 10, 6)
             },
             {
               item_title: 'Liqui-Gels, 200 mg Ibuprofen',
               item_sku: 'B-132-14432-332',
               item_price: 14.97,
               item_quantity: 1804,
               item_brand: 'Advil',
               item_category: 'health',
               created_at: DateTime.new(2021, 10, 23)
             },
             {
               item_title: 'Dry Dog Food',
               item_sku: '5282197',
               item_price: 12.99,
               item_quantity: 12,
               item_brand: 'Iams',
               item_category: 'pet',
               created_at: DateTime.new(2021, 10, 17)
             },
             {
               item_title: 'Dry Dog Food',
               item_sku: '5282197',
               item_price: 12.99,
               item_quantity: 6,
               item_brand: 'Iams',
               item_category: 'pet',
               created_at: DateTime.new(2021, 10, 22)
             },
             {
               item_title: 'The Little Book of Common Sense Investing, Hardcover',
               item_sku: '111940570',
               item_price: 20.70,
               item_quantity: 40,
               item_brand: 'John C. Bogle (Author)',
               item_category: 'book',
               created_at: DateTime.new(2021, 10, 24)
             },
             {
               item_title: 'Otaki Climbing Shoes',
               item_sku: '10T',
               item_price: 195.00,
               item_quantity: 12,
               item_brand: 'La Sportiva',
               item_category: 'clothing',
               created_at: DateTime.new(2021, 10, 11)
             },
             {
               item_title: 'French Oven, 5.3 L',
               item_sku: '20000032311',
               item_price: 525.00,
               item_quantity: 30,
               item_brand: 'Creuset',
               item_category: 'cooking',
               created_at: DateTime.new(2021, 10, 23)
             },
             {
               item_title: 'French Oven, 5.3 L',
               item_sku: '20000032311',
               item_price: 525.00,
               item_quantity: 27,
               item_brand: 'Creuset',
               item_category: 'cooking',
               created_at: DateTime.new(2021, 10, 21)
             },
             # 11. November
             {
               item_title: 'D3 Stainless Steel Saute Pan',
               item_sku: '3454FE23F3F222',
               item_price: 342.42,
               item_quantity: 37,
               item_brand: 'All-Clad',
               item_category: 'cooking',
               created_at: DateTime.new(2021, 11, 3)
             },
             {
               item_title: 'Chicken thighs 500 lbs',
               item_sku: 'POK-POK-P000K',
               item_price: 8.99,
               item_quantity: 44,
               item_brand: "Richard's Farm",
               item_category: 'food',
               created_at: DateTime.new(2021, 11, 12)
             },
             {
               item_title: 'Patsy 68" Velvet Tuxedo Arm Sofa',
               item_sku: 'W8420398402332',
               item_price: 1499.99,
               item_quantity: 10,
               item_brand: 'Etta Avenue',
               item_category: 'furniture',
               created_at: DateTime.new(2021, 11, 6)
             },
             {
               item_title: 'Liqui-Gels, 200 mg Ibuprofen',
               item_sku: 'B-132-14432-332',
               item_price: 14.97,
               item_quantity: 120,
               item_brand: 'Advil',
               item_category: 'health',
               created_at: DateTime.new(2021, 11, 23)
             },
             {
               item_title: 'Liqui-Gels, 200 mg Ibuprofen',
               item_sku: 'B-132-14432-332',
               item_price: 14.97,
               item_quantity: 22,
               item_brand: 'Advil',
               item_category: 'health',
               created_at: DateTime.new(2021, 11, 12)
             },
             {
               item_title: 'Dry Dog Food',
               item_sku: '5282197',
               item_price: 12.99,
               item_quantity: 2,
               item_brand: 'Iams',
               item_category: 'pet',
               created_at: DateTime.new(2021, 11, 22)
             },
             {
               item_title: 'The Little Book of Common Sense Investing, Hardcover',
               item_sku: '111940570',
               item_price: 20.70,
               item_quantity: 3,
               item_brand: 'John C. Bogle (Author)',
               item_category: 'book',
               created_at: DateTime.new(2021, 11, 24)
             },
             {
               item_title: 'Otaki Climbing Shoes',
               item_sku: '10T',
               item_price: 195.00,
               item_quantity: 0,
               item_brand: 'La Sportiva',
               item_category: 'clothing',
               created_at: DateTime.new(2021, 11, 11)
             },
             {
               item_title: 'French Oven, 5.3 L',
               item_sku: '20000032311',
               item_price: 525.00,
               item_quantity: 17,
               item_brand: 'Creuset',
               item_category: 'cooking',
               created_at: DateTime.new(2021, 11, 23)
             },
             {
               item_title: 'French Oven, 5.3 L',
               item_sku: '20000032311',
               item_price: 525.00,
               item_quantity: 12,
               item_brand: 'Creuset',
               item_category: 'cooking',
               created_at: DateTime.new(2021, 11, 21)
             },
             {
               item_title: 'French Oven, 5.3 L',
               item_sku: '20000032311',
               item_price: 525.00,
               item_quantity: 4,
               item_brand: 'Creuset',
               item_category: 'cooking',
               created_at: DateTime.new(2021, 11, 21)
             },
             # 12. December
             {
               item_title: "Men's Hair Loss & Thinning Treatment",
               item_sku: 'SER-32232-232-FAEWF',
               item_price: 156.99,
               item_quantity: 20,
               item_brand: 'Rogaine',
               item_category: 'health',
               created_at: DateTime.new(2021, 12, 6)
             },
             {
               item_title: 'Family Card Game',
               item_sku: 'S23433342332F',
               item_price: 17.99,
               item_quantity: 32,
               item_brand: 'Uno',
               item_category: 'game',
               created_at: DateTime.new(2021, 12, 12)
             },
             {
               item_title: 'Family Card Game',
               item_sku: 'S23433342332F',
               item_price: 17.99,
               item_quantity: 11,
               item_brand: 'Uno',
               item_category: 'game',
               created_at: DateTime.new(2021, 12, 22)
             },
             {
               item_title: 'Macaroni & Cheese, Pack of 12',
               item_sku: '61502058432958',
               item_price: 12.00,
               item_quantity: 124,
               item_brand: 'Kraft Dinner',
               item_category: 'food',
               created_at: DateTime.new(2021, 12, 7)
             },
             {
               item_title: 'Macaroni & Cheese, Pack of 12',
               item_sku: '61502058432958',
               item_price: 12.00,
               item_quantity: 28,
               item_brand: 'Kraft Dinner',
               item_category: 'food',
               created_at: DateTime.new(2021, 12, 1)
             },
             {
               item_title: 'Macaroni & Cheese, Pack of 12',
               item_sku: '61502058432958',
               item_price: 12.00,
               item_quantity: 0,
               item_brand: 'Kraft Dinner',
               item_category: 'food',
               created_at: DateTime.new(2021, 12, 17)
             },
             {
               item_title: "Men's Hair Loss & Thinning Treatment",
               item_sku: 'SER-32232-232-FAEWF',
               item_price: 156.99,
               item_quantity: 12,
               item_brand: 'Rogaine',
               item_category: 'health',
               created_at: DateTime.new(2021, 12, 3)
             },
             {
               item_title: 'Family Card Game',
               item_sku: 'S23433342332F',
               item_price: 17.99,
               item_quantity: 12,
               item_brand: 'Uno',
               item_category: 'game',
               created_at: DateTime.new(2021, 12, 19)
             },
             {
               item_title: 'Family Card Game',
               item_sku: 'S23433342332F',
               item_price: 17.99,
               item_quantity: 3,
               item_brand: 'Uno',
               item_category: 'game',
               created_at: DateTime.new(2021, 12, 3)
             },
             {
               item_title: 'Macaroni & Cheese, Pack of 12',
               item_sku: '61502058432958',
               item_price: 12.00,
               item_quantity: 1500,
               item_brand: 'Kraft Dinner',
               item_category: 'food',
               created_at: DateTime.new(2021, 12, 30)
             },
             {
               item_title: 'Macaroni & Cheese, Pack of 12',
               item_sku: '61502058432958',
               item_price: 12.00,
               item_quantity: 1293,
               item_brand: 'Kraft Dinner',
               item_category: 'food',
               created_at: DateTime.new(2021, 12, 29)
             },
             {
               item_title: 'Macaroni & Cheese, Pack of 12',
               item_sku: '61502058432958',
               item_price: 12.00,
               item_quantity: 952,
               item_brand: 'Kraft Dinner',
               item_category: 'food',
               created_at: DateTime.new(2021, 12, 30)
             }

           ])

# ========================================
# | Year 2022 logs
# ========================================
Log.create([
             # January
             {
               item_title: 'Sample item title from seed.rb',
               item_sku: 'SOME-SKU',
               item_price: 99.99,
               item_quantity: 4,
               item_brand: 'Sample brand',
               item_category: 'Sample category',
               created_at: DateTime.new(2022, 1, 14)
             }
           ])

p "Created #{Log.count} sample logs."
