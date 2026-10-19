<?php
require_once 'conexao.php';
header('Content-Type: application/json; charset=utf-8');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $artigo_id  = trim($_POST['artigo_id'] ?? 'registro-sp');
    $nome       = trim($_POST['nome'] ?? '');
    $comentario = trim($_POST['comentario'] ?? '');

    if (!empty($nome) && !empty($comentario)) {
        
        $stmtCheck = $pdo->prepare("
            SELECT id FROM comentarios 
            WHERE artigo_id = ? 
              AND nome = ? 
              AND comentario = ? 
              AND data_criacao >= NOW() - INTERVAL 1 MINUTE
        ");
        $stmtCheck->execute([$artigo_id, $nome, $comentario]);

        if ($stmtCheck->rowCount() > 0) {
            echo json_encode([
                'sucesso' => false, 
                'mensagem' => 'Atenção: Este comentário já foi publicado recentemente!'
            ]);
            exit;
        }
        $stmt = $pdo->prepare("INSERT INTO comentarios (artigo_id, nome, comentario) VALUES (?, ?, ?)");
        $stmt->execute([$artigo_id, $nome, $comentario]);

        echo json_encode(['sucesso' => true, 'mensagem' => 'Comentário publicado com sucesso!']);
        exit;
    }
}

echo json_encode(['sucesso' => false, 'mensagem' => 'Preencha todos os campos antes de enviar.']);