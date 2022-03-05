<?php
try {
    $pdo = new PDO(
        'mysql:host=db;dbname=mysql',
        'root',
        'password',
    );
    $stmt = $pdo->prepare('SELECT * FROM db');
    $stmt->execute();
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    var_dump($result);
} catch (PDOException $e) {
    echo $e->getMessage();
}