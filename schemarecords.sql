CREATE DATABASE IF NOT EXISTS grocery_fr;
USE grocery_fr;

CREATE TABLE grocery_items (
    item_id        INT AUTO_INCREMENT PRIMARY KEY,
    item_name      VARCHAR(100) NOT NULL,
    brand          VARCHAR(50)  NOT NULL,
    category       VARCHAR(30)  NOT NULL,
    price          DECIMAL(8,2) NOT NULL,
    stock_quantity INT          NOT NULL DEFAULT 0,
    unit_size      VARCHAR(20),
    expiry_date    DATE,
    is_imported    BOOLEAN      NOT NULL DEFAULT FALSE
);

INSERT INTO grocery_items
    (item_name, brand, category, price, stock_quantity, unit_size, expiry_date, is_imported)
VALUES
-- Dairy (15)
('Camembert Cheese',          'Président',     'Dairy',       180.00, 80,  '250g', '2027-12-15', FALSE),
('Brie Cheese',               'Président',     'Dairy',       190.00, 70,  '250g', '2027-12-20', FALSE),
('Roquefort Blue Cheese',     'Société',       'Dairy',       220.00, 60,  '200g', '2027-11-30', FALSE),
('Yogurt Nature',             'Danone',        'Dairy',        45.00, 200, '125g', '2026-12-01', FALSE),
('Fruit Yogurt Strawberry',   'Danone',        'Dairy',        50.00, 180, '125g', '2026-12-05', FALSE),
('Butter Salted',             'Lactalis',      'Dairy',        95.00, 150, '250g', '2027-01-15', FALSE),
('Butter Unsalted',           'Lactalis',      'Dairy',        95.00, 140, '250g', '2027-01-20', FALSE),
('Cream Fresh',               'Elle & Vire',   'Dairy',        85.00, 120, '200ml','2026-12-10', FALSE),
('Goat Cheese',               'Chavroux',      'Dairy',       150.00, 90,  '150g', '2027-02-01', FALSE),
('Fromage Blanc',             'Danone',        'Dairy',        65.00, 100, '200g', '2026-12-15', FALSE),
('Comté Cheese',              'Jura Local',    'Dairy',       210.00, 70,  '250g', '2027-12-25', FALSE),
('Emmental',                  'Entremont',     'Dairy',       180.00, 90,  '250g', '2027-12-30', FALSE),
('Saint-Nectaire',            'Local French',  'Dairy',       200.00, 60,  '250g', '2027-11-15', FALSE),
('Mozzarella',                'Galbani',       'Dairy',       120.00, 100, '125g', '2026-12-20', TRUE),
('Parmesan',                  'Parmalat',      'Dairy',       250.00, 80,  '200g', '2027-01-10', TRUE),

-- Beverages (15)
('Mineral Water',             'Evian',         'Beverages',    40.00, 300, '500ml','2027-08-01', FALSE),
('Sparkling Water',           'Perrier',       'Beverages',    45.00, 280, '500ml','2027-08-05', FALSE),
('Apple Juice',               'Joker',         'Beverages',    65.00, 200, '1L',   '2027-05-01', FALSE),
('Orange Juice',              'Tropicana',     'Beverages',    70.00, 180, '1L',   '2027-05-05', FALSE),
('Red Wine Bordeaux',         'Château Margaux','Beverages', 1200.00,40,  '750ml','2029-01-01', FALSE),
('White Wine Chardonnay',     'Louis Jadot',   'Beverages',   950.00, 50,  '750ml','2029-01-01', FALSE),
('Rosé Wine Provence',        'Miraval',       'Beverages',   850.00, 60,  '750ml','2029-01-01', FALSE),
('Beer Kronenbourg 1664',     'Kronenbourg',   'Beverages',    95.00, 120, '500ml','2027-07-15', FALSE),
('Beer Fischer Amber',        'Fischer',       'Beverages',   100.00, 100, '500ml','2027-07-20', FALSE),
('Apple Cider',               'Val de Rance',  'Beverages',   150.00, 80,  '750ml','2028-01-01', FALSE),
('Champagne Brut',            'Moët & Chandon','Beverages',  1500.00,30,  '750ml','2029-01-01', FALSE),
('Whisky',                    'Chivas Regal',  'Beverages',   1200.00,40, '700ml','2029-01-01', TRUE),
('Gin',                       'Bombay Sapphire','Beverages',  1100.00,50, '700ml','2029-01-01', TRUE),
('Cola Drink',                'Coca-Cola',     'Beverages',    45.00, 200, '330ml','2027-06-01', TRUE),
('Green Tea',                 'Lipton',        'Beverages',    55.00, 180, '330ml','2027-06-05', TRUE),

-- Bakery & Snacks (15)
('Madeleines',                'St Michel',     'Bakery',       85.00, 150, '250g', '2026-11-30', FALSE),
('Croissant Butter',          'Local French',  'Bakery',       45.00, 200, '60g',  '2026-10-30', FALSE),
('Pain au Chocolat',          'Local French',  'Bakery',       50.00, 180, '70g',  '2026-10-30', FALSE),
('Baguette',                  'Local French',  'Bakery',       35.00, 250, '250g', '2026-10-25', FALSE),
('Petit Écolier Biscuits',    'LU',            'Snacks',       95.00, 120, '150g', '2027-01-15', FALSE),
('Prince Chocolate Biscuits', 'LU',            'Snacks',       90.00, 130, '150g', '2027-01-20', FALSE),
('Bonne Maman Madeleines',    'Bonne Maman',   'Snacks',      120.00, 100, '250g', '2027-02-01', FALSE),
('Bonne Maman Tartlets',      'Bonne Maman',   'Snacks',      125.00, 90,  '250g', '2027-02-05', FALSE),
('Chips Nature',              'Vico',          'Snacks',       65.00, 200, '150g', '2027-03-01', FALSE),
('Chips Paprika',             'Vico',          'Snacks',       70.00, 180, '150g', '2027-03-05', FALSE),
('Chocolate Bar',             'Lindt',         'Snacks',      120.00, 100, '100g', '2027-04-01', TRUE),
('Chocolate Bar',             'Milka',         'Snacks',      115.00, 90,  '100g', '2027-04-05', TRUE),
('Gummy Bears',               'Haribo',        'Snacks',       95.00, 120, '100g', '2027-04-10', TRUE),
('Nutella Spread',            'Ferrero',       'Snacks',      150.00, 80,  '350g', '2027-05-01', TRUE),
('Oreo Cookies',              'Mondelez',      'Snacks',       85.00, 150, '150g', '2027-05-05', TRUE),

-- Condiments & Cooking (15)
('Mayonnaise',                'Amora',         'Condiments',   75.00, 130, '250ml','2027-12-01', FALSE),
('Ketchup',                   'Amora',         'Condiments',   70.00, 140, '250ml','2027-12-05', FALSE),
('Bouillon Cubes',            'Maggi',         'Condiments',   55.00, 200, '120g', '2028-02-10', FALSE),
('Herbes de Provence',        'Local French',  'Condiments',   65.00, 100, '50g',  '2028-03-01', FALSE),
('Olive Oil',                 'Puget',         'Cooking',     250.00, 90,  '1L',   '2028-05-01', FALSE),
('Sunflower Oil',             'Lesieur',       'Cooking',     220.00, 100, '1L',   '2028-05-05', FALSE),
('Vinegar Red Wine',          'Maille',        'Condiments',   95.00, 120, '500ml','2028-06-01', FALSE),
('Soy Sauce',                 'Kikkoman',      'Condiments',   85.00, 100, '250ml','2028-06-10', TRUE),
('Sriracha Hot Sauce',        'Huy Fong',      'Condiments',   95.00, 90,  '250ml','2028-06-15', TRUE),
('Wasabi Paste',              'S&B',           'Condiments',   120.00, 80, '43g',  '2028-06-20', TRUE),
('Curry Powder',              'Local French',  'Condiments',   75.00, 100, '50g',  '2028-07-01', FALSE),
('Paprika Powder',            'Local French',  'Condiments',   70.00, 100, '50g',  '2028-07-05', FALSE),
('Black Pepper',              'Local French',  'Condiments',   65.00, 120, '50g',  '2028-07-10', FALSE),
('Sea Salt',                  'Camargue',      'Condiments',   85.00, 150, '250g', '2028-07-15', FALSE),
('Truffle Oil',               'Local French',  'Condiments',  350.00, 50,  '100ml','2028-07-20', FALSE),

-- Canned Goods (15)
('Cassoulet',                 'William Saurin','Canned Goods',150.00, 80,  '420g', '2028-03-01', FALSE),
('Ratatouille',               'William Saurin','Canned Goods',140.00, 90,  '400g', '2028-03-05', FALSE),
('Coq au Vin',                'William Saurin','Canned Goods',160.00, 70,  '400g', '2028-03-10', FALSE),
('Duck Confit',               'Comtesse du Barry','Canned Goods',300.00,50,'400g','2028-04-01', FALSE),
('Pâté de Campagne',          'Comtesse du Barry','Canned Goods',180.00,60,'200g','2028-04-05', FALSE),
('Foie Gras',                 'Comtesse du Barry','Canned Goods',500.00,40,'200g','2028-04-10', FALSE),
('Sardines in Oil',           'Connétable',    'Canned Goods',120.00,100, '115g', '2028-05-01', FALSE),
('Mackerel Fillets',          'Connétable',    'Canned Goods',130.00,90,  '115g', '2028-05-05', FALSE),
('Tuna in Olive Oil',         'Petit Navire',  'Canned Goods',140.00,80,  '160g', '2028-05-10', FALSE),
('Anchovies',                 'Ortiz',         'Canned Goods',150.00,70,  '100g', '2028-05-15', TRUE),
('Tomato Paste',              'Mutti',         'Canned Goods', 85.00,120, '200g', '2028-05-20', TRUE),
('Chickpeas',                 'Carrefour',     'Canned Goods', 65.00,150, '400g', '2028-05-25', FALSE),
('Red Beans',                 'Carrefour',     'Canned Goods', 70.00,140, '400g', '2028-05-30', FALSE),
('Green Lentils',             'Carrefour',     'Canned Goods', 75.00,130, '400g', '2028-06-01', FALSE),
('Sweet Corn',                'Bonduelle',     'Canned Goods', 80.00,120, '300g', '2028-06-05', FALSE),

-- Meat & Frozen (10)
('Chicken Nuggets',           'Carrefour',     'Meat',        150.00, 100, '1kg',  '2026-12-01', FALSE),
('Frozen Pizza',              'Dr. Oetker',    'Frozen',      120.00, 90,  '350g', '2027-01-01', TRUE),
('Frozen Lasagna',            'Marie',         'Frozen',      140.00, 80,  '400g', '2027-01-05', FALSE),
('Frozen Quiche Lorraine',    'Marie',         'Frozen',      130.00, 70,  '400g', '2027-01-10', FALSE),
('Frozen Spinach',            'Carrefour',     'Frozen',       85.00, 120, '500g', '2027-01-15', FALSE),
('Frozen Green Beans',        'Carrefour',     'Frozen',       90.00, 110, '500g', '2027-01-20', FALSE),
('Frozen Strawberries',       'Carrefour',     'Frozen',      100.00, 100, '500g', '2027-01-25', FALSE),
('Frozen Blueberries',        'Carrefour',     'Frozen',      110.00, 90,  '500g', '2027-01-30', FALSE),
('Frozen Salmon Fillet',      'Labeyrie',      'Frozen',      250.00, 80,  '400g', '2027-02-01', FALSE),
('Frozen Shrimp',             'Labeyrie',      'Frozen',      220.00, 70,  '400g', '2027-02-05', FALSE),

-- Breakfast & Cereals (5)
('Corn Flakes',               'Kellogg’s',     'Cereal',       95.00, 150, '250g', '2027-08-01', TRUE),
('Muesli Classic',            'Bjorg',         'Cereal',      120.00, 100, '500g', '2027-08-05', FALSE),
('Granola Chocolate',         'Carrefour',     'Cereal',      110.00, 120, '400g', '2027-08-10', FALSE),
('Oatmeal',                   'Quaker',        'Cereal',       85.00, 130, '400g', '2027-08-15', TRUE),
('Rice Krispies',             'Kellogg’s',     'Cereal',       90.00, 140, '250g', '2027-08-20', TRUE),

-- Sweets & Desserts (5)
('Jam Strawberry',            'Bonne Maman',   'Spreads',      95.00, 150, '370g', '2027-09-01', FALSE),
('Jam Apricot',               'Bonne Maman',   'Spreads',      95.00, 140, '370g', '2027-09-05', FALSE),
('Chocolate Mousse',          'Nestlé',        'Desserts',     85.00, 120, '125g', '2026-12-01', TRUE),
('Crème Caramel',             'Nestlé',        'Desserts',     90.00, 110, '125g', '2026-12-05', TRUE),
('Macarons Assorted',         'Ladurée',       'Desserts',    250.00, 80,  '150g', '2026-12-10', FALSE),

-- Pasta & Rice (5)
('Spaghetti',                 'Barilla',       'Pasta',        85.00, 200, '500g', '2028-01-01', TRUE),
('Penne Rigate',              'Barilla',       'Pasta',        85.00, 180, '500g', '2028-01-05', TRUE),
('Tagliatelle',               'Lustucru',      'Pasta',        95.00, 150, '500g', '2028-01-10', FALSE),
('Basmati Rice',              'Taureau Ailé',  'Rice',        120.00, 140, '1kg',  '2028-01-15', FALSE),
('Arborio Rice',              'Riso Gallo',    'Rice',        130.00, 130, '1kg',  '2028-01-20', TRUE);



