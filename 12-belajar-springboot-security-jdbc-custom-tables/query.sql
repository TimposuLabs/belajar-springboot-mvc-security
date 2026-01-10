USE `belajar_spring`;

DROP TABLE IF EXISTS `roles`;
DROP TABLE IF EXISTS `accounts`;

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `user_id` varchar(50) NOT NULL,
  `user_password` char(68) NOT NULL,
  `active` tinyint NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Inserting data for table `accounts`
--

INSERT INTO `accounts` 
VALUES 
-- Password = test123 --
('aco','$2a$12$J5TR1bl3yRrUJ5LHAezNH.r8Bs9zCOuTsop2PAmUxmUEP7j7V5Mke',1), 
('ade','$2a$12$J5TR1bl3yRrUJ5LHAezNH.r8Bs9zCOuTsop2PAmUxmUEP7j7V5Mke',1),
('ucup','$2a$12$J5TR1bl3yRrUJ5LHAezNH.r8Bs9zCOuTsop2PAmUxmUEP7j7V5Mke',1);


--Z
-- Table structure for table `roles`
--shoishoi




CREATE TABLE `roles` (
  `user_id` varchar(50) NOT NULL,
  `user_role` varchar(50) NOT NULL,
  UNIQUE KEY `authorities5_idx_1` (`user_id`,`user_role`),
  CONSTRAINT `authorities5_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `accounts` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Inserting data for table `roles`
--

INSERT INTO `roles` 
VALUES 
('aco','ROLE_GUEST'),
('ade','ROLE_GUEST'),
('ade','ROLE_USERS'),
('ucup','ROLE_GUEST'),
('ucup','ROLE_USERS'),
('ucup','ROLE_ADMIN');