<?php
require_once 'conexao.php';
header('Content-Type: application/json; charset=utf-8');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $artigo_id  = trim($_POST['artigo_id'] ?? 'conscientizacao');
    $nome       = trim($_POST['nome'] ?? '');
    $comentario = trim($_POST['comentario'] ?? '');

    if (!empty($nome) && !empty($comentario)) {
        $stmt = $pdo->prepare("INSERT INTO comentarios (artigo_id, nome, comentario) VALUES (?, ?, ?)");
        $stmt->execute([$artigo_id, $nome, $comentario]);

        echo json_encode(['sucesso' => true, 'mensagem' => 'Comentário publicado!']);
        exit;
    }
}

echo json_encode(['sucesso' => false, 'mensagem' => 'Preencha todos os campos antes de enviar.']);