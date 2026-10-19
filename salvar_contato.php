<?php
require_once 'conexao.php';
header('Content-Type: application/json; charset=utf-8');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nome     = trim($_POST['nome'] ?? '');
    $email    = trim($_POST['email'] ?? '');
    $assunto  = trim($_POST['assunto'] ?? '');
    $mensagem = trim($_POST['mensagem'] ?? '');

    if (!empty($nome) && !empty($email) && !empty($assunto) && !empty($mensagem)) {
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            echo json_encode(['sucesso' => false, 'mensagem' => 'Por favor, insira um e-mail válido.']);
            exit;
        }

        $stmt = $pdo->prepare("INSERT INTO mensagens_contato (nome, email, assunto, mensagem) VALUES (?, ?, ?, ?)");
        $stmt->execute([$nome, $email, $assunto, $mensagem]);

        echo json_encode([
            'sucesso' => true,
            'mensagem' => 'Mensagem enviada com sucesso! A equipe da SPI retornará em breve.'
        ]);
        exit;
    }
}

echo json_encode(['sucesso' => false, 'mensagem' => 'Preencha todos os campos antes de enviar.']);