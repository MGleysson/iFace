
CREATE TABLE `amizade` (
  `idamizade` int(11) NOT NULL AUTO_INCREMENT,
  `id_amigo_remetente` int(11) DEFAULT NULL,
  `id_amigo_destinatario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idamizade`),
  KEY `amigo1_fk_idx` (`id_amigo_remetente`),
  KEY `amigo2_fk_idx` (`id_amigo_destinatario`),
  CONSTRAINT `amigo1_fk` FOREIGN KEY (`id_amigo_remetente`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `amigo2_fk` FOREIGN KEY (`id_amigo_destinatario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

CREATE TABLE `comunidade` (
  `idComunidade` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `idUsuarioGerente` int(11) NOT NULL,
  PRIMARY KEY (`idComunidade`),
  KEY `idUsuarioGerente_idx` (`idUsuarioGerente`),
  CONSTRAINT `idUsuarioGerente` FOREIGN KEY (`idUsuarioGerente`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

CREATE TABLE `comunidade_usuario` (
  `id_comunidade` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  KEY `id_comunidade_idx` (`id_comunidade`),
  KEY `id_usuario_fk_idx` (`id_usuario`),
  CONSTRAINT `id_comunidade_fk` FOREIGN KEY (`id_comunidade`) REFERENCES `comunidade` (`idComunidade`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_usuario_fk` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `mensagem_amigo` (
  `idmensagem` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) DEFAULT NULL,
  `conteudo` varchar(255) DEFAULT NULL,
  `id_usuario_remetente` int(11) DEFAULT NULL,
  `id_usuario_destinatario` int(11) DEFAULT NULL,
  `data_hora` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idmensagem`),
  KEY `usuario_remetente_fk_idx` (`id_usuario_remetente`),
  KEY `u_destinatario_fk_idx` (`id_usuario_destinatario`),
  CONSTRAINT `u_destinatario_fk` FOREIGN KEY (`id_usuario_destinatario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `u_remetente_fk` FOREIGN KEY (`id_usuario_remetente`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

CREATE TABLE `mensagem_comunidade` (
  `idmensagem_comunidade` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) DEFAULT NULL,
  `conteudo` varchar(255) DEFAULT NULL,
  `id_usuario_remetente` int(11) DEFAULT NULL,
  `id_comunidade` int(11) DEFAULT NULL,
  `data_hora` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idmensagem_comunidade`),
  KEY `u_rem_fk_idx` (`id_usuario_remetente`),
  KEY `comunidade_fk_idx` (`id_comunidade`),
  CONSTRAINT `comunidade_fk` FOREIGN KEY (`id_comunidade`) REFERENCES `comunidade` (`idComunidade`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `u_rem_fk` FOREIGN KEY (`id_usuario_remetente`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE `pedido_amizade` (
  `idpedido_amizade` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario_remetente` int(11) DEFAULT NULL,
  `id_usuario_destinatario` int(11) DEFAULT NULL,
  `status_pedido` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idpedido_amizade`),
  KEY `usuario_remetente_fk_idx` (`id_usuario_destinatario`),
  KEY `usuario_remetente_fk_idx1` (`id_usuario_remetente`),
  CONSTRAINT `usuario_destinatario_fk` FOREIGN KEY (`id_usuario_destinatario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usuario_remetente_fk` FOREIGN KEY (`id_usuario_remetente`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

CREATE TABLE `pedido_comunidade` (
  `idpedido_comunidade` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario_remetente` int(11) NOT NULL,
  `id_usuario_gerente` int(11) NOT NULL,
  `id_comunidade_pedido` int(11) DEFAULT NULL,
  `status_pedido` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idpedido_comunidade`),
  KEY `id_usuario_remetente_fk_idx` (`id_usuario_remetente`),
  KEY `id_usuario_gerente_fk_idx` (`id_usuario_gerente`),
  KEY `id_comunidade_pedido_fk` (`id_comunidade_pedido`),
  CONSTRAINT `id_comunidade_pedido_fk` FOREIGN KEY (`id_comunidade_pedido`) REFERENCES `comunidade` (`idComunidade`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_usuario_gerente_fk` FOREIGN KEY (`id_usuario_gerente`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_usuario_remetente_fk` FOREIGN KEY (`id_usuario_remetente`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `sobrenome` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `idade` varchar(45) DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `nome_usuario` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `nome_usuario_UNIQUE` (`nome_usuario`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
