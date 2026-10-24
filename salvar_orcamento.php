<?php
require_once 'conexao.php';
header('Content-Type: application/json; charset=utf-8');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nome             = trim($_POST['nome'] ?? '');
    $email            = trim($_POST['email'] ?? '');
    $telefone         = trim($_POST['telefone'] ?? '');
    $cidade           = trim($_POST['cidade'] ?? '');
    $entidade         = trim($_POST['entidade'] ?? '');
    $tipo_organizacao = trim($_POST['tipo_organizacao'] ?? '');
    $cruzamentos      = (int)($_POST['cruzamentos'] ?? 1);
    $mensagem         = trim($_POST['mensagem'] ?? '');

    if (!empty($nome) && !empty($email) && !empty($entidade) && !empty($cidade)) {
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            echo json_encode(['sucesso' => false, 'mensagem' => 'Insira um e-mail válido.']);
            exit;
        }

        $stmt = $pdo->prepare("
            INSERT INTO solicitacoes_orcamento 
            (nome, email, telefone, cidade, entidade, tipo_organizacao, cruzamentos, mensagem) 
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        ");
        $stmt->execute([$nome, $email, $telefone, $cidade, $entidade, $tipo_organizacao, $cruzamentos, $mensagem]);

        echo json_encode([
            'sucesso' => true,
            'mensagem' => 'Solicitação enviada com sucesso! A equipe de engenharia da SPI entrará em contato.'
        ]);
        exit;
    }
}

echo json_encode(['sucesso' => false, 'mensagem' => 'Preencha todos os campos obrigatórios.']);