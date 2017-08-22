
##CREATE DATABASE test;
##USE test;


CREATE TABLE `tcnotebookgroup` (
  `notebook_group_id` 	INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `notebook_group_name` VARCHAR(50)  DEFAULT NULL COMMENT '名称',
  `text_sum` 		INT  NOT NULL DEFAULT '0' COMMENT '代码',
  `create_date` 	TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `flag` 		INT  NOT NULL DEFAULT '0'  COMMENT '名称',

  PRIMARY KEY (`notebook_group_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='笔记本组';




CREATE TABLE `tcnotebook` (
  `noteBook_id` 	INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `notebook_name` 	VARCHAR(50)  DEFAULT NULL COMMENT '名称',
  `text_sum` 		INT  NOT NULL DEFAULT '0' COMMENT '代码',
  `create_date` 	TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `flag` 		INT  NOT NULL DEFAULT '0'  COMMENT '名称',
  `notebook_group` INT(11) NOT NULL COMMENT 'notebook_group_id外键', ##`notebook_group_id`

  PRIMARY KEY (`noteBook_id`),
  ##KEY `notebook_group_id` (`notebook_group`)    ##前者是拥有该主键的表的主键id,后者是当前表的属性(引入的外键)
  CONSTRAINT `fk_tcnotebook_tcnotebookgroup`  FOREIGN KEY (`notebook_group`)REFERENCES `tcnotebookgroup`(`notebook_group_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='笔记本';

CREATE TABLE `tcnote` (
  `note_id` 	INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `note_name` 	VARCHAR(50)  DEFAULT NULL COMMENT '名称',
  `author_name` VARCHAR(50)  DEFAULT NULL COMMENT '代码',
  `from_url` 	VARCHAR(255) DEFAULT NULL COMMENT '名称',
  `blob_content` BLOB DEFAULT NULL COMMENT '名称',
  `create_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `flag` 	INTEGER      NOT NULL DEFAULT '0' COMMENT '名称',

  `noteBook` 	INT(11) NOT NULL COMMENT '名称',
  `noteBookGroup` INT(11) NOT NULL COMMENT '名称',

  PRIMARY KEY (`note_id`),
 ## KEY `noteBook_id` (`noteBook`) ,	##前者是拥有该主键的表的主键id,后者是当前表的属性(引入的外键)
 ## KEY `notebook_group_id` (`noteBookGroup`)
  CONSTRAINT `fk_tcnote_tcnotebook`  FOREIGN KEY (`noteBook`)	REFERENCES `tcnotebook`(`noteBook_id`),
  CONSTRAINT `fk_tcnote_tcnotebookgroup`  FOREIGN KEY (`noteBookGroup`)	REFERENCES `tcnotebookgroup`(`notebook_group_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='笔记';




INSERT INTO  `tcnotebookgroup`(`notebook_group_id`, `notebook_group_name`) VALUES (1,'笔记本组1'),(2,'笔记本组2'),(3,'笔记本组3');
INSERT INTO  `tcnotebook`(`noteBook_id`, `notebook_name`,`notebook_group`) VALUES (1,'笔记本1',2),(2,'笔记本2',2),(3,'笔记本3',1);
INSERT INTO  `tcnote`(`note_id`, `note_name`, `noteBook`, `noteBookGroup`) VALUES (1,'笔记1',1,2),(2,'笔记2',1,2),(3,'笔记3',3, 1);


DROP TABLE `tcnote`;
DROP TABLE `tcnotebook`;
DROP TABLE `tcnotebookgroup`;


/*
如何使用Navicat将psc备份导入到MySQL： http://www.cuiwenyuan.com/shanghai/post/how-to-use-navicat-for-mysql-to-restore-psc-file.html
我的电脑： C:\Users\lx\Documents\Navicat\MySQL\servers

	把.psc文件放入到D:\CRM\000\zhengDiy2\zheng-master\project-datamodel(右键"备份"后点击"提取sql"的路径)，然后再次点击"提取sql"，此时就可以把.psc文件转化为.sql文件了！

*/