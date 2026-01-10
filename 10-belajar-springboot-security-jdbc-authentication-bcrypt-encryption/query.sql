USE `belajar_spring`;

DROP TABLE IF EXISTS `authorities`;
DROP TABLE IF EXISTS `users`;

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` char(68) NOT NULL,
  `enabled` tinyint NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Inserting data for table `users`
--

INSERT INTO `users` 
VALUES 
-- Password = test123 --
('aco','{bcrypt}$2a$12$J5TR1bl3yRrUJ5LHAezNH.r8Bs9zCOuTsop2PAmUxmUEP7j7V5Mke',1), 
('ade','{bcrypt}$2a$12$J5TR1bl3yRrUJ5LHAezNH.r8Bs9zCOuTsop2PAmUxmUEP7j7V5Mke',1),
('ucup','{bcrypt}$2a$12$J5TR1bl3yRrUJ5LHAezNH.r8Bs9zCOuTsop2PAmUxmUEP7j7V5Mke',1);


--
-- Table structure for table `authorities`
--

CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `authorities_idx_1` (`username`,`authority`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Inserting data for table `authorities`
--

INSERT INTO `authorities` 
VALUES 
('aco','ROLE_GUEST'),
('ade','ROLE_GUEST'),
('ade','ROLE_USERS'),
('ucup','ROLE_GUEST'),
('ucup','ROLE_USERS'),
('ucup','ROLE_ADMIN');