<?php
require_once 'conexao.php';
header('Content-Type: application/json; charset=utf-8');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $pergunta = trim($_POST['pergunta'] ?? '');

    if (!empty($pergunta)) {
        $stmt = $pdo->prepare("INSERT INTO faq (pergunta) VALUES (?)");
        $stmt->execute([$pergunta]);

        echo json_encode(['sucesso' => true, 'mensagem' => 'Dúvida enviada com sucesso!']);
        exit;
    }
}

echo json_encode(['sucesso' => false, 'mensagem' => 'Digite uma pergunta válida antes de enviar.']);