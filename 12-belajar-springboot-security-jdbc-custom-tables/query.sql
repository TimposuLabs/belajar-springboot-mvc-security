USE `belajar_spring`;

DROP TABLE IF EXISTS `roles`;
DROP TABLE IF EXISTS `members`;

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `user_id` varchar(50) NOT NULL,
  `password` char(68) NOT NULL,
  `active` tinyint NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Inserting data for table `members`
--

INSERT INTO `members` 
VALUES 
-- Password = test123 --
('aco','{bcrypt}$2a$12$J5TR1bl3yRrUJ5LHAezNH.r8Bs9zCOuTsop2PAmUxmUEP7j7V5Mke',1), 
('ade','{bcrypt}$2a$12$J5TR1bl3yRrUJ5LHAezNH.r8Bs9zCOuTsop2PAmUxmUEP7j7V5Mke',1),
('ucup','{bcrypt}$2a$12$J5TR1bl3yRrUJ5LHAezNH.r8Bs9zCOuTsop2PAmUxmUEP7j7V5Mke',1);


--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `user_id` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  UNIQUE KEY `authorities5_idx_1` (`user_id`,`role`),
  CONSTRAINT `authorities5_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `members` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Inserting data for table `roles`
--

INSERT INTO `roles` 
VALUES 
('aco','ROLE_GUEST'),
('ade','ROLE_GUEST'),
('ade','ROLE_USER'),
('ucup','ROLE_GUEST'),
('ucup','ROLE_USER'),
('ucup','ROLE_ADMIN');