<?php
require_once 'conexao.php';
header('Content-Type: application/json; charset=utf-8');

$artigo_id = $_GET['artigo_id'] ?? 'conscientizacao';

$stmt = $pdo->prepare("SELECT nome, comentario, DATE_FORMAT(data_criacao, '%d/%m/%Y às %H:%i') AS data_formatada FROM comentarios WHERE artigo_id = ? ORDER BY id DESC");
$stmt->execute([$artigo_id]);
$comentarios = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($comentarios);