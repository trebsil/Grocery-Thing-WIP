<?php require_once 'core/dbconfig.php'; ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PDO Activity</title>
</head>
<body>

<?php
/* ============================================================
   1. fetchAll(): get ALL rows as an array of arrays
   ============================================================ */
echo "<h2>1. fetchAll()</h2>";

$stmt = $pdo->prepare("SELECT * FROM grocery_items");
if ($stmt->execute()) {
    $items = $stmt->fetchAll();   // every row at once
    echo "<pre>";                 // <pre> keeps print_r() readable
    print_r($items);
    echo "</pre>";
}

/* ============================================================
   2. fetch(): get ONE row
   ============================================================ */
echo "<h2>2. fetch()</h2>";

$stmt = $pdo->prepare("SELECT * FROM grocery_items WHERE item_id = :id");
if ($stmt->execute([':id' => 1])) {
    $item = $stmt->fetch();       // a single row, not a list
    echo "<pre>";
    print_r($item);
    echo "</pre>";
}

/* ============================================================
   3. INSERT: add a new record
   ============================================================ */
echo "<h2>3. Insert</h2>";

$sql = "INSERT INTO grocery_items
            (item_name, brand, category, price, stock_quantity, unit_size, expiry_date, is_imported)
        VALUES
            (:name, :brand, :category, :price, :stock, :size, :expiry, :imported)";

$stmt = $pdo->prepare($sql);
$stmt->execute([
    ':name'     => 'Camembert de Normandie',
    ':brand'    => 'Président',
    ':category' => 'Dairy',
    ':price'    => 3.49,
    ':stock'    => 40,
    ':size'     => '250g',
    ':expiry'   => '2026-12-31',
    ':imported' => 0,
]);

// lastInsertId() gives the auto-generated ID of the row we just added
$newId = $pdo->lastInsertId();
echo "Inserted new item with ID: " . $newId;

/* ============================================================
   4. UPDATE: change an existing record
   ============================================================ */
echo "<h2>4. Update</h2>";

// WHERE item_id = :id limits the change to ONE row
$stmt = $pdo->prepare("UPDATE grocery_items
                       SET price = :price, stock_quantity = :stock
                       WHERE item_id = :id");
$stmt->execute([
    ':price' => 2.99,
    ':stock' => 120,
    ':id'    => 1,       // the item with ID 1
]);

// rowCount() = number of rows actually changed
echo "Rows updated: " . $stmt->rowCount();
/* ============================================================
   5. HTML TABLE: render a query's result set
   ============================================================ */
echo "<h2>5. Result set in an HTML table</h2>";

$stmt = $pdo->prepare("SELECT item_id, item_name, brand, category, price, stock_quantity
                       FROM grocery_items
                       ORDER BY item_id DESC
                       LIMIT 10");   // newest 10, so the inserted row shows up
$stmt->execute();
$rows = $stmt->fetchAll();
?>

<table border="1" cellpadding="6" cellspacing="0">
    <thead>
        <tr>
            <th>ID</th>
            <th>Item</th>
            <th>Brand</th>
            <th>Category</th>
            <th>Price (€)</th>
            <th>Stock</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($rows as $row): ?>
            <tr>
                <!-- htmlspecialchars() prevents data from breaking the HTML -->
                <td><?= htmlspecialchars($row['item_id']) ?></td>
                <td><?= htmlspecialchars($row['item_name']) ?></td>
                <td><?= htmlspecialchars($row['brand']) ?></td>
                <td><?= htmlspecialchars($row['category']) ?></td>
                <td><?= htmlspecialchars($row['price']) ?></td>
                <td><?= htmlspecialchars($row['stock_quantity']) ?></td>
            </tr>
        <?php endforeach; ?>
    </tbody>
</table>

<?php
/* ============================================================
   6. DELETE: remove the record added in section 3
   ============================================================ */
echo "<h2>6. Delete</h2>";

// Match the demo row by its name and brand, not by a stored ID
$stmt = $pdo->prepare("DELETE FROM grocery_items
                       WHERE item_name = :name AND brand = :brand");
$stmt->execute([
    ':name'  => 'Camembert de Normandie',
    ':brand' => 'Président',
]);

echo "Rows deleted: " . $stmt->rowCount();