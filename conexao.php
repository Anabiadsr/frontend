<?php
$host = 'localhost';
$db   = 'spi_site';
$user = 'root';
$pass = ''; // Tem que estar assim vazio '' se não tiver posto senha

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8mb4", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo json_encode(['erro' => 'Falha na conexao: ' . $e->getMessage()]);
    exit;
}
?>