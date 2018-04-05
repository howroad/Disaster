/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 60003
Source Host           : localhost:3306
Source Database       : db_forest_disaster

Target Server Type    : MYSQL
Target Server Version : 60003
File Encoding         : 65001

Date: 2018-04-04 18:47:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_area
-- ----------------------------
DROP TABLE IF EXISTS `t_area`;
CREATE TABLE `t_area` (
  `area_id` int(11) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(20) DEFAULT NULL,
  `area_forest` varchar(20) DEFAULT NULL,
  `area_adv` varchar(20) DEFAULT NULL,
  `area_land` int(11) DEFAULT NULL,
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_area
-- ----------------------------
INSERT INTO `t_area` VALUES ('1', '成都金牛区', '柏杨林', '柏树', '2');
INSERT INTO `t_area` VALUES ('2', '绵阳涪城区', '针阔林', '松树', '1');
INSERT INTO `t_area` VALUES ('3', '成都天府新区', '桐林', '泡桐树', '3');
INSERT INTO `t_area` VALUES ('4', '成都高新西区', '竹林', '灌木林', '4');
INSERT INTO `t_area` VALUES ('5', '成都高新区', '柏杨林', '杨树', '5');
INSERT INTO `t_area` VALUES ('6', '成都双流区', '桐林', '梧桐树', '1');
INSERT INTO `t_area` VALUES ('7', '济南历下区', '柏杨林', '柏树', '2');
INSERT INTO `t_area` VALUES ('8', '德州禹城市', '柏杨林', '柏树', '3');
INSERT INTO `t_area` VALUES ('9', '绵阳游仙区', '松树', '灌木林', '4');
INSERT INTO `t_area` VALUES ('10', '济南大学城', '柏杨林', '灌木林', '5');
INSERT INTO `t_area` VALUES ('11', '禹城实验小学', '柏树林', '柏树', '5');
INSERT INTO `t_area` VALUES ('24', '交警宿舍', '杨树林', '杨树', '3');
INSERT INTO `t_area` VALUES ('25', 'test', 'test', 'test', '1');

-- ----------------------------
-- Table structure for t_class
-- ----------------------------
DROP TABLE IF EXISTS `t_class`;
CREATE TABLE `t_class` (
  `cls_id` int(11) NOT NULL AUTO_INCREMENT,
  `cls_name` varchar(20) DEFAULT NULL,
  `cls_person` varchar(20) DEFAULT NULL,
  `cls_tel` varchar(20) DEFAULT NULL,
  `cls_pnum` int(11) DEFAULT NULL,
  `cls_date` date DEFAULT NULL,
  `cls_area_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cls_id`),
  KEY `cls_area_id` (`cls_area_id`),
  CONSTRAINT `t_class_ibfk_1` FOREIGN KEY (`cls_area_id`) REFERENCES `t_area` (`area_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_class
-- ----------------------------
INSERT INTO `t_class` VALUES ('1', '浪沃J153', '周春红', '18618618616', '29', '2018-03-30', '1');
INSERT INTO `t_class` VALUES ('2', '浪沃J154', '赵子墨', '153133355664', '30', '2018-03-29', '2');
INSERT INTO `t_class` VALUES ('3', '浪沃F46', '路昊', '18613207088z', '25', '2018-03-27', '3');
INSERT INTO `t_class` VALUES ('4', '浪沃J155', '陈婷', '18877998866111', '28', '2018-03-30', '8');
INSERT INTO `t_class` VALUES ('5', '浪沃J156', '柯强', '135353538588', '29', '2018-03-12', '4');
INSERT INTO `t_class` VALUES ('6', '天府大队一队', '文泓泉', '13666888866', '100', '2018-03-01', '5');
INSERT INTO `t_class` VALUES ('7', '成都总队6队', '伍辰汉', '18612545568', '500', '2018-03-21', '6');
INSERT INTO `t_class` VALUES ('8', '济南交警大队4队', '李文凯', '17044556699', '100', '2017-12-30', '10');
INSERT INTO `t_class` VALUES ('9', '禹城交警大队', '洛永林', '15666552347', '50', '2018-03-14', '9');
INSERT INTO `t_class` VALUES ('10', '绵阳龙山大队', '徐超波', '14633225566', '100', '2018-03-06', '7');
INSERT INTO `t_class` VALUES ('18', '小班001', '张三', '123123123123', '10', '2018-04-03', '11');
INSERT INTO `t_class` VALUES ('21', '成都交警大队4队', '陈韵蕊', '110', '50', '2018-04-04', '24');
INSERT INTO `t_class` VALUES ('22', 'test1', 'test1', 'test1', '8', '2018-04-04', '25');

-- ----------------------------
-- Table structure for t_consultation_detal
-- ----------------------------
DROP TABLE IF EXISTS `t_consultation_detal`;
CREATE TABLE `t_consultation_detal` (
  `cdtl_id` int(11) NOT NULL AUTO_INCREMENT,
  `cdtl_exp_id` int(11) DEFAULT NULL,
  `cdtl_clog_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cdtl_id`),
  KEY `cdtl_exp_id` (`cdtl_exp_id`),
  KEY `cdtl_clog_id` (`cdtl_clog_id`),
  CONSTRAINT `t_consultation_detal_ibfk_1` FOREIGN KEY (`cdtl_exp_id`) REFERENCES `t_expert` (`exp_id`),
  CONSTRAINT `t_consultation_detal_ibfk_2` FOREIGN KEY (`cdtl_clog_id`) REFERENCES `t_consultation_log` (`clog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_consultation_detal
-- ----------------------------
INSERT INTO `t_consultation_detal` VALUES ('2', '3', '2');
INSERT INTO `t_consultation_detal` VALUES ('3', '2', '2');
INSERT INTO `t_consultation_detal` VALUES ('4', '7', '2');
INSERT INTO `t_consultation_detal` VALUES ('5', '1', '3');
INSERT INTO `t_consultation_detal` VALUES ('6', '5', '3');
INSERT INTO `t_consultation_detal` VALUES ('7', '9', '3');
INSERT INTO `t_consultation_detal` VALUES ('8', '4', '4');
INSERT INTO `t_consultation_detal` VALUES ('9', '6', '4');
INSERT INTO `t_consultation_detal` VALUES ('10', '5', '5');
INSERT INTO `t_consultation_detal` VALUES ('11', '9', '6');
INSERT INTO `t_consultation_detal` VALUES ('12', '1', '6');
INSERT INTO `t_consultation_detal` VALUES ('13', '8', '7');
INSERT INTO `t_consultation_detal` VALUES ('14', '8', '7');
INSERT INTO `t_consultation_detal` VALUES ('15', '4', '8');
INSERT INTO `t_consultation_detal` VALUES ('16', '6', '9');
INSERT INTO `t_consultation_detal` VALUES ('17', '5', '10');
INSERT INTO `t_consultation_detal` VALUES ('18', '11', '12');
INSERT INTO `t_consultation_detal` VALUES ('19', '12', '12');
INSERT INTO `t_consultation_detal` VALUES ('26', '5', '16');
INSERT INTO `t_consultation_detal` VALUES ('27', '9', '16');
INSERT INTO `t_consultation_detal` VALUES ('28', '11', '17');
INSERT INTO `t_consultation_detal` VALUES ('29', '12', '17');
INSERT INTO `t_consultation_detal` VALUES ('30', '23', '18');
INSERT INTO `t_consultation_detal` VALUES ('31', '5', '18');
INSERT INTO `t_consultation_detal` VALUES ('35', '2', '21');
INSERT INTO `t_consultation_detal` VALUES ('36', '7', '21');

-- ----------------------------
-- Table structure for t_consultation_log
-- ----------------------------
DROP TABLE IF EXISTS `t_consultation_log`;
CREATE TABLE `t_consultation_log` (
  `clog_id` int(11) NOT NULL AUTO_INCREMENT,
  `clog_date` date DEFAULT NULL,
  `clog_result` varchar(50) DEFAULT NULL,
  `clog_dlog_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`clog_id`),
  KEY `clog_dlog_id` (`clog_dlog_id`),
  CONSTRAINT `t_consultation_log_ibfk_1` FOREIGN KEY (`clog_dlog_id`) REFERENCES `t_disaster_log` (`dlog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_consultation_log
-- ----------------------------
INSERT INTO `t_consultation_log` VALUES ('2', '2018-03-28', '大量放置捕鼠笼，定期清理', '3');
INSERT INTO `t_consultation_log` VALUES ('3', '2018-03-29', '使用敌敌畏杀虫', '1');
INSERT INTO `t_consultation_log` VALUES ('4', '2018-03-30', '诱虫灯诱捕，杀虫精杀虫', '5');
INSERT INTO `t_consultation_log` VALUES ('5', '2018-02-05', '大量喷洒多菌灵，直到治好', '4');
INSERT INTO `t_consultation_log` VALUES ('6', '2018-03-27', '灭扫利乳油专业杀松毛虫', '2');
INSERT INTO `t_consultation_log` VALUES ('7', '2018-12-23', '敌杀死乳油即可杀死', '6');
INSERT INTO `t_consultation_log` VALUES ('8', '2018-05-05', '天干物燥，小心火烛', '7');
INSERT INTO `t_consultation_log` VALUES ('9', '2018-03-25', '诱虫灯诱捕，杀虫精杀虫', '8');
INSERT INTO `t_consultation_log` VALUES ('10', '2018-03-24', '天干物燥，小心火烛', '9');
INSERT INTO `t_consultation_log` VALUES ('11', '2018-05-06', '敌杀死乳油即可杀死', '10');
INSERT INTO `t_consultation_log` VALUES ('12', '2018-04-02', '大量放置杀虫剂', '10');
INSERT INTO `t_consultation_log` VALUES ('16', '2018-04-03', '没救啦', '10');
INSERT INTO `t_consultation_log` VALUES ('17', '2018-04-03', '大量放置杀虫剂', '10');
INSERT INTO `t_consultation_log` VALUES ('18', '2018-04-03', '灭扫利乳油专业杀松毛虫', '10');
INSERT INTO `t_consultation_log` VALUES ('21', '2018-04-04', 'vdvddcd', '28');

-- ----------------------------
-- Table structure for t_disaster_log
-- ----------------------------
DROP TABLE IF EXISTS `t_disaster_log`;
CREATE TABLE `t_disaster_log` (
  `dlog_id` int(11) NOT NULL AUTO_INCREMENT,
  `dlog_name` varchar(20) DEFAULT NULL,
  `dlog_pic` varchar(50) DEFAULT NULL,
  `dlog_date` date DEFAULT NULL,
  `dlog_type` int(11) DEFAULT NULL,
  `dlog_stage` int(11) DEFAULT NULL,
  `dlog_desc` varchar(100) DEFAULT NULL,
  `dlog_found` int(11) DEFAULT NULL,
  `dlog_loss` varchar(20) DEFAULT NULL,
  `dlog_influence` varchar(20) DEFAULT NULL,
  `dlog_plan` varchar(50) DEFAULT NULL,
  `dlog_area_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`dlog_id`),
  KEY `dlog_area_id` (`dlog_area_id`),
  CONSTRAINT `t_disaster_log_ibfk_1` FOREIGN KEY (`dlog_area_id`) REFERENCES `t_area` (`area_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_disaster_log
-- ----------------------------
INSERT INTO `t_disaster_log` VALUES ('1', '金牛区松毛虫事件', '1.jpg', '2018-03-01', '1', '3', '受灾地区有虫蛀率达到75%,虫口密度平均为每柱20头，大量的松树松叶被吃光', '1', '56万元', '1200亩', '喷洒敌百虫,黑光灯诱饵', '1');
INSERT INTO `t_disaster_log` VALUES ('2', '双流区松毛虫事件', '2.jpg', '2018-02-26', '1', '3', '受灾地区有虫率高达60%，虫口密度为平均每柱15头，很多树木被吃光', '1', '22万元', '500亩', '释放天敌', '2');
INSERT INTO `t_disaster_log` VALUES ('3', '攀枝花虫害事件', '3.jpg', '2018-03-15', '1', '3', '受灾地区有虫率高达44%，老鼠密度为平均每每亩20头，很多庄家被吃光', '1', '600万元', '400亩', '释放大量眼镜蛇', '3');
INSERT INTO `t_disaster_log` VALUES ('4', '成都松林病害事件', '4.jpg', '2018-02-05', '2', '3', '受灾地区染病树木率达到60%，大量的松树松叶染病', '1', '30万元', '500亩', '喷洒多菌液', '4');
INSERT INTO `t_disaster_log` VALUES ('5', '绵阳美国白鹅事件', '5.jpg', '2018-03-15', '1', '3', '受灾地区有鹅率高达44%，白鹅天天大喊大叫，很多居民不堪受扰', '2', '0.5万元', '3亩', '自生自灭吧！', '8');
INSERT INTO `t_disaster_log` VALUES ('6', '绵阳小龙虾泛滥事件', '6.jpg', '2017-12-12', '2', '3', '受灾地区发现大量小龙虾', '2', '20万', '20亩', '派吃货去吃', '5');
INSERT INTO `t_disaster_log` VALUES ('7', '大兴安岭火灾', '7.jpg', '2018-01-02', '1', '3', '受灾地区3000亩，一片火海', '2', '1000万', '3000亩', '等降雨', '6');
INSERT INTO `t_disaster_log` VALUES ('8', '成都白蛾虫害事件', '8.jpg', '2018-01-03', '1', '3', '受灾地区有虫率高达60%，虫口密度为平均每柱8头，很多树木被吃光', '3', '48万元', '480亩', '喷洒敌百虫', '9');
INSERT INTO `t_disaster_log` VALUES ('9', '小兴安岭火灾', '8.jpg', '2018-01-02', '1', '1', '受灾地区3000亩，一片火海', '2', '500万', '3000亩', '不需要了！！', '7');
INSERT INTO `t_disaster_log` VALUES ('10', '成都天牛虫害事件', '10.jpg', '2018-03-04', '1', '3', '受灾地区有虫率高达60%，虫口密度为平均每柱5头，很多树木被钻洞', '3', '80万', '250亩', '方案还没与偶', '10');
INSERT INTO `t_disaster_log` VALUES ('11', '一个事件', '123.jpg', '2010-01-01', '3', '1', '这是描述', '1', '损失惨重', '影响很广泛', '方案还没与偶', '1');
INSERT INTO `t_disaster_log` VALUES ('28', '交警宿舍猫害', '1522833159694_deepin.bmp', '2018-04-04', '2', '1', '猫很多，因为老鼠太多了', '1', '50万', '50亩', '灭鼠', '3');

-- ----------------------------
-- Table structure for t_expert
-- ----------------------------
DROP TABLE IF EXISTS `t_expert`;
CREATE TABLE `t_expert` (
  `exp_id` int(11) NOT NULL AUTO_INCREMENT,
  `exp_name` varchar(20) DEFAULT NULL,
  `exp_gender` varchar(20) DEFAULT NULL,
  `exp_birth` date DEFAULT NULL,
  `exp_pic` varchar(50) DEFAULT NULL,
  `exp_special` varchar(20) DEFAULT NULL,
  `exp_office` varchar(20) DEFAULT NULL,
  `exp_tel` varchar(20) DEFAULT NULL,
  `exp_company` varchar(20) DEFAULT NULL,
  `exp_address` varchar(50) DEFAULT NULL,
  `exp_email` varchar(50) DEFAULT NULL,
  `exp_exsit` int(11) DEFAULT NULL,
  PRIMARY KEY (`exp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_expert
-- ----------------------------
INSERT INTO `t_expert` VALUES ('1', '李鹏', '男', '1970-10-12', '1.jpg', '虫害防治', '副教授', '15574931493', '雅安市虫害研究院', '成都市武侯区一段2号', 'LP@163.com', '0');
INSERT INTO `t_expert` VALUES ('2', '何玉蕊', '女', '1976-05-08', '2.jpg', '鼠害防治', '教授', '13598745698', '雅安市鼠害研究院', '成都市武侯区一段2号', 'HYR@qq.com', '0');
INSERT INTO `t_expert` VALUES ('3', '陶大宇', '男', '1985-05-09', '3.jpg', '鼠害防治', '副教授', '15698745874', '成都生物研究所', '成都市高新区二号', 'TDY@163.com', '0');
INSERT INTO `t_expert` VALUES ('4', '麦梗', '男', '1965-08-07', '4.jpg', '森林病害防治', '教授', '15698745987', '成都森林灾害防治中心', '成都市红牌楼东站', 'MG@163.com', '0');
INSERT INTO `t_expert` VALUES ('5', '路昊', '男', '1994-08-08', '5.jpg', '虫害防治', '实习生', '13689568956', '成都森林灾害防治中心', '成都市武侯区一段2号', 'LH@qq.com', '0');
INSERT INTO `t_expert` VALUES ('6', '伍宸汉', '男', '1997-08-08', '6.jpg', '森林病害防治', '研究员', '13323232323', '成都生物研究所', '成都市武侯区一段2号', 'WCH@163.com', '0');
INSERT INTO `t_expert` VALUES ('7', '陈韵蕊', '女', '1994-08-08', '7.jpg', '鼠害防治', '副教授', '13345874587', '成都生物研究所', '成都市红牌楼东站', 'CYR@gmail.com', '0');
INSERT INTO `t_expert` VALUES ('8', '赵子墨', '男', '1994-06-26', '8.jpg', '森林病害防治', '教授', '13569874587', '华西再生医学研究中心', '成都市青羊小区', 'ZZM@gmail.com', '0');
INSERT INTO `t_expert` VALUES ('9', '柯强林', '男', '1995-05-05', '9.jpg', '虫害防治', '实习生', '1365689568', '成都生物研究所', '成都市高新区二号', 'KQL@163.com', '0');
INSERT INTO `t_expert` VALUES ('10', '文泓泉', '男', '1993-09-09', '10.jpg', '森林病害防治', '研究院', '15655454545', '华西再生医学研究中心', '成都市青羊小区', 'WHQ@qq.com', '1');
INSERT INTO `t_expert` VALUES ('11', '张三', '男', '1986-05-06', '11.jpg', '虫害防治', '副教授', '13555655532', '成都森林灾害防治中心', '成都市红牌楼东站', 'ZS@qq.com', '1');
INSERT INTO `t_expert` VALUES ('12', '李四', '女', '1988-12-02', '12.jpg', '鼠害防治', '研究员', '13666666666', '雅安市鼠害研究院', '雅安大道五号', 'LS@163.com', '1');
INSERT INTO `t_expert` VALUES ('22', '王五', '男', '2018-04-02', '1522663332012_ChXnRuiU8AAdfEL.jpg', '虫害防治', '研究员导师', '13674964588', '雅安虫害研究中心', '成都市青羊小区', 'WW@163.com', '0');
INSERT INTO `t_expert` VALUES ('23', '赵六', '女', '2018-04-02', '1522663363791_ChXnRuiU8AAdfEL.jpg', '虫害防治', '研究员', '13674964588', '雅安虫害研究中心', '成都市青羊小区', 'ZL@163.com', '1');
INSERT INTO `t_expert` VALUES ('29', '捕猫专家', '男', '1992-07-01', '1522833254046_deepin.bmp', '鼠害防治', '队长', '16985645247', '公安局', '交警宿舍', '110@qq.com', '0');

-- ----------------------------
-- Table structure for t_illness
-- ----------------------------
DROP TABLE IF EXISTS `t_illness`;
CREATE TABLE `t_illness` (
  `ill_id` int(11) NOT NULL AUTO_INCREMENT,
  `ill_name` varchar(20) DEFAULT NULL,
  `ill_cause` varchar(20) DEFAULT NULL,
  `ill_status` varchar(20) DEFAULT NULL,
  `ill_law` varchar(20) DEFAULT NULL,
  `ill_pic` varchar(50) DEFAULT NULL,
  `ill_cure` varchar(255) DEFAULT NULL,
  `ill_harm` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_illness
-- ----------------------------
INSERT INTO `t_illness` VALUES ('1', '猝倒病', '属卵菌', '烂种', '春秋两季', '20.jpg', '改善密度', '植株死亡');
INSERT INTO `t_illness` VALUES ('2', '花叶病', '黄瓜花叶病毒', '出现浅绿色板块', '四到六月', '21.jpg', '打农药', '出现大量灰色霉层，然后死亡');
INSERT INTO `t_illness` VALUES ('3', '立枯病', '枯丝菌核', '出现暗褐色病斑', '三到四月', '22.jpg', '防止高温高湿条件', '立春枯死');
INSERT INTO `t_illness` VALUES ('4', '叶斑病', '浆果赤霉', '侵害根叶受伤', '四到五月', '22.jpg', '注意排水', '影响美观');
INSERT INTO `t_illness` VALUES ('5', '褐斑病', '半知菌真菌', '褐斑在叶片生长', '一到二月', '23.jpg', '及时清理', '叶片枯黄，造成死亡');
INSERT INTO `t_illness` VALUES ('6', '病毒病', '黄瓜花叶病毒病', '在叶片上形成斑驳', '春夏两季', '24.jpg', '使用抗芽威', '叶片脱落，然后死亡');
INSERT INTO `t_illness` VALUES ('7', '霜霉病', '霉菌', '核绿病斑', '一到二月', '25.jpg', '合理密植', '影响观赏');
INSERT INTO `t_illness` VALUES ('8', '马铃薯病', '马铃薯病毒', '产生叶青素', '三到四月', '26.jpg', '增加光照', '不能食用');
INSERT INTO `t_illness` VALUES ('9', '烂叶病', '烂叶病菌', '叶片腐烂', '春秋两季', '27.jpg', '喷农药', '叶片腐烂，导致死亡');
INSERT INTO `t_illness` VALUES ('10', '花柳病', '花柳病菌', '烂根', '四到八月', '28.jpg', '洒化肥', '根腐烂，导致不能生长');
INSERT INTO `t_illness` VALUES ('22', '叶黄病', 'HG658病毒', '树叶变黄色', '一年一次', '1522832825111_deepin.bmp', '施肥', '营养不良');

-- ----------------------------
-- Table structure for t_insect
-- ----------------------------
DROP TABLE IF EXISTS `t_insect`;
CREATE TABLE `t_insect` (
  `ins_id` int(11) NOT NULL AUTO_INCREMENT,
  `ins_name` varchar(20) DEFAULT NULL,
  `ins_master` varchar(20) DEFAULT NULL,
  `ins_breed` varchar(20) DEFAULT NULL,
  `ins_enemy` varchar(20) DEFAULT NULL,
  `ins_child_pic` varchar(50) DEFAULT NULL,
  `ins_old_pic` varchar(50) DEFAULT NULL,
  `ins_cure` varchar(255) DEFAULT NULL,
  `ins_harm` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ins_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_insect
-- ----------------------------
INSERT INTO `t_insect` VALUES ('1', '咖啡脊虎天牛', '金银花', '一年六到八胎，一胎六到八只', '大公鸡', '22.jpg', '30.jpg', '喷药', '黄叶');
INSERT INTO `t_insect` VALUES ('2', '红角长蝽', '宁夏枸杞', '一年三到四胎，一胎四到五只', '小白鹅', '22.jpg', '31.jpg', '人工捉虫', '烂根');
INSERT INTO `t_insect` VALUES ('3', '黄野螟', '白木香', '一年四到六胎，一胎三到二只', '乌鸦', '3.jpg', '29.jpg', '喷洒农药', '烂叶');
INSERT INTO `t_insect` VALUES ('4', '草地螟', '人参', '一年一到二胎，一胎八到十只', '喜鹊', '4.jpg', '10.jpg', '杀虫清', ' 啃食根茎叶');
INSERT INTO `t_insect` VALUES ('5', '斜纹夜蛾', '人参', ' 一年十到十五胎，一胎三到二只', '斑鸠', '5.jpg', '10.jpg', '一气肠虫清', '  限制生长');
INSERT INTO `t_insect` VALUES ('6', '康氏粉蚧', '宁夏枸杞', ' 一年四到八胎，一胎十到十二只', '大黄鸭', '6.jpg', '10.jpg', ' 安本达多片', ' 烂根、叶');
INSERT INTO `t_insect` VALUES ('7', '二星蝽', '水稻', ' 一年三到四胎，一胎四到三只', '麻雀', '7.jpg', '10.jpg', ' 青霉素', ' 缺茎少叶');
INSERT INTO `t_insect` VALUES ('8', '黄刺蛾', '核桃', ' 一年七到八胎，一胎二到三只', '鹦鹉', '8.jpg', '10.jpg', '三磷酸腺苷二钠', ' 不结果');
INSERT INTO `t_insect` VALUES ('9', '菜螟', '青菜', ' 一年五到九胎，一胎三到五只', ' 小肥鸡', '9.jpg', '10.jpg', '复合氨基酸', ' 影响美观');
INSERT INTO `t_insect` VALUES ('10', '沟金针虫', '西瓜', ' 一年十到八只，一胎八到十只', '唐老鸭', '10.jpg', '10.jpg', '双氢氯噻嗪', ' 汁水不甜');
INSERT INTO `t_insect` VALUES ('23', '知了', '柳树', '一年1次', '人类', '1522832715832_deepin.bmp', '1522832715834_deepin.bmp', '不需要防治', '很吵闹');
INSERT INTO `t_insect` VALUES ('24', '测试', '测试', '测试', '测试', '1522833522298_desktop.ini', '1522833522299_desktop.ini', '成都成都', '成都成都');

-- ----------------------------
-- Table structure for t_medicine
-- ----------------------------
DROP TABLE IF EXISTS `t_medicine`;
CREATE TABLE `t_medicine` (
  `med_id` int(11) NOT NULL AUTO_INCREMENT,
  `med_name` varchar(20) DEFAULT NULL,
  `med_disaster` int(11) DEFAULT NULL,
  `med_type` int(11) DEFAULT NULL,
  `med_use` varchar(50) DEFAULT NULL,
  `med_stock` int(11) DEFAULT NULL,
  PRIMARY KEY (`med_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_medicine
-- ----------------------------
INSERT INTO `t_medicine` VALUES ('1', '杀鼠迷', '3', '1', '用于捕杀各种鼠类', '9933');
INSERT INTO `t_medicine` VALUES ('2', '灭扫利乳油', '1', '1', '杀灭松毛虫，刺蛾', '9844');
INSERT INTO `t_medicine` VALUES ('3', '敌杀死乳油', '1', '1', '杀灭樱花介壳虫', '9321');
INSERT INTO `t_medicine` VALUES ('4', '捕鼠笼', '3', '2', '捕捉各种鼠类', '10000');
INSERT INTO `t_medicine` VALUES ('5', '灭虫精', '1', '1', '杀灭各种虫类', '9923');
INSERT INTO `t_medicine` VALUES ('6', '老鼠药', '3', '1', '杀灭各种鼠类', '10000');
INSERT INTO `t_medicine` VALUES ('7', '树活丸', '2', '1', '治疗各种病害树木', '10000');
INSERT INTO `t_medicine` VALUES ('8', '伸腿瞪眼丸', '2', '1', '用于治疗病害严重的树木', '9955');
INSERT INTO `t_medicine` VALUES ('9', '诱虫灯', '1', '2', '用于诱杀飞蛾类', '10000');
INSERT INTO `t_medicine` VALUES ('10', '三步倒', '3', '1', '毒杀各种鼠类', '10000');
INSERT INTO `t_medicine` VALUES ('11', '杀虫剂', '1', '1', '对着虫子喷', '10000');
INSERT INTO `t_medicine` VALUES ('14', '杀虫剂2号', '1', '1', '对着虫子喷', '10000');
INSERT INTO `t_medicine` VALUES ('15', '杀虫剂3号', '1', '1', '对着虫子喷', '9879');
INSERT INTO `t_medicine` VALUES ('16', '杀虫剂4号', '1', '1', '对着虫子喷', '10000');
INSERT INTO `t_medicine` VALUES ('17', '百草灵5号', '1', '1', '杀虫', '9945');
INSERT INTO `t_medicine` VALUES ('18', '百草灵', '1', '1', '杀虫', '10000');
INSERT INTO `t_medicine` VALUES ('19', '要你命三千', '3', '2', '捉老鼠', '10000');
INSERT INTO `t_medicine` VALUES ('20', '百草枯200ml', '3', '2', '杀虫', '10000');
INSERT INTO `t_medicine` VALUES ('21', '镭射枪', '3', '2', '杀人', '988');
INSERT INTO `t_medicine` VALUES ('22', '敌敌畏', '3', '2', '杀虫', '444');
INSERT INTO `t_medicine` VALUES ('23', '毒鼠强', '1', '1', '杀老鼠', '89989');
INSERT INTO `t_medicine` VALUES ('28', '虫皮完', '1', '1', '杀很皮的虫', '9998');
INSERT INTO `t_medicine` VALUES ('29', '敌敌畏', '1', '1', '也一样', '4');

-- ----------------------------
-- Table structure for t_mouse
-- ----------------------------
DROP TABLE IF EXISTS `t_mouse`;
CREATE TABLE `t_mouse` (
  `mou_id` int(11) NOT NULL AUTO_INCREMENT,
  `mou_name` varchar(20) DEFAULT NULL,
  `mou_food` varchar(20) DEFAULT NULL,
  `mou_breed` varchar(20) DEFAULT NULL,
  `mou_enemy` varchar(20) DEFAULT NULL,
  `mou_pic` varchar(50) DEFAULT NULL,
  `mou_cure` varchar(255) DEFAULT NULL,
  `mou_harm` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mou_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_mouse
-- ----------------------------
INSERT INTO `t_mouse` VALUES ('1', '小白鼠', '大米', '一年三胎，一胎十只', '人类', '1.jpg', '限制繁殖', '偷大米');
INSERT INTO `t_mouse` VALUES ('2', '小黑鼠', '包谷', '一年两胎，一胎八个', '猫', '1.jpg', '多养猫', '偷包谷');
INSERT INTO `t_mouse` VALUES ('3', '田鼠', '五谷杂粮', '一年四胎，一胎十只', '猫头鹰', '1.jpg', '少捕猎', '粮食减产');
INSERT INTO `t_mouse` VALUES ('4', '仓鼠', '稻谷', '一月一次，一次四只', '蛇', '1.jpg', '少繁殖', '浪费粮食');
INSERT INTO `t_mouse` VALUES ('5', '竹鼠', '竹笋', '一年四胎，一胎四只', '狗', '1.jpg', '多捕捉', '损害竹笋');
INSERT INTO `t_mouse` VALUES ('6', '鼹鼠', '花生', '一年两胎，一胎两只', '蛇', '1.jpg', '毒鼠强', '偷花生');
INSERT INTO `t_mouse` VALUES ('7', '小黄鼠', '小麦', '一年三胎，一胎十只', '猫', '1.jpg', '耗儿药', '损害土质');
INSERT INTO `t_mouse` VALUES ('8', '小绿鼠', '高粱', '一年两胎，一胎五只', '猫头鹰', '1.jpg', '毒鼠强', '偷高粱');
INSERT INTO `t_mouse` VALUES ('9', '紫金鼠', '吃岩石', '三年一胎，一胎一只', '大鹏鸟', '1.jpg', '防止不了', '损害地质');
INSERT INTO `t_mouse` VALUES ('10', '傲娇鼠', '吃空气', '不繁殖', '无天敌', '1.jpg', '净化空气', '破坏大气层');
INSERT INTO `t_mouse` VALUES ('13', '大田鼠', '杂食', '一月1次', '蛇', '1522832926042_deepin.bmp', '捕鼠夹', '吃庄稼');

-- ----------------------------
-- Table structure for t_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `t_operate_log`;
CREATE TABLE `t_operate_log` (
  `olog_id` int(11) NOT NULL AUTO_INCREMENT,
  `olog_action` varchar(50) DEFAULT NULL,
  `olog_time` datetime DEFAULT NULL,
  `olog_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`olog_id`),
  KEY `t_operate_log_ibfk_1` (`olog_user_id`),
  CONSTRAINT `t_operate_log_ibfk_1` FOREIGN KEY (`olog_user_id`) REFERENCES `t_user` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_operate_log
-- ----------------------------
INSERT INTO `t_operate_log` VALUES ('1', '登录系统', '2018-03-01 10:03:51', '1');
INSERT INTO `t_operate_log` VALUES ('2', '登录系统', '2018-03-05 10:03:59', '2');
INSERT INTO `t_operate_log` VALUES ('3', '登录系统', '2018-03-09 10:04:04', '3');
INSERT INTO `t_operate_log` VALUES ('4', '登录系统', '2018-03-12 10:55:10', '4');
INSERT INTO `t_operate_log` VALUES ('5', '登录系统', '2018-03-27 18:04:28', '5');
INSERT INTO `t_operate_log` VALUES ('7', '登录系统', '2018-02-20 10:27:02', '6');
INSERT INTO `t_operate_log` VALUES ('8', '登录系统', '2018-03-18 10:27:20', '7');
INSERT INTO `t_operate_log` VALUES ('9', '登录系统', '2018-03-24 10:50:27', '8');
INSERT INTO `t_operate_log` VALUES ('10', '登录系统', '2018-02-20 12:07:40', '9');
INSERT INTO `t_operate_log` VALUES ('12', '登录系统', '2018-04-02 10:37:28', '1');
INSERT INTO `t_operate_log` VALUES ('13', '登录系统', '2018-04-02 10:37:42', '1');
INSERT INTO `t_operate_log` VALUES ('14', '登录系统', '2018-04-02 10:46:45', '1');
INSERT INTO `t_operate_log` VALUES ('118', '登陆系统', '2018-04-04 16:39:10', '1');
INSERT INTO `t_operate_log` VALUES ('119', '登陆系统', '2018-04-04 16:41:45', '5');
INSERT INTO `t_operate_log` VALUES ('120', '登陆系统', '2018-04-04 16:42:47', '5');
INSERT INTO `t_operate_log` VALUES ('121', '登陆系统', '2018-04-04 16:45:22', '2');
INSERT INTO `t_operate_log` VALUES ('122', '登陆系统', '2018-04-04 16:50:26', '12');
INSERT INTO `t_operate_log` VALUES ('123', '添加用户:zlgl', '2018-04-04 16:51:12', '12');
INSERT INTO `t_operate_log` VALUES ('124', '登陆系统', '2018-04-04 16:52:07', '12');
INSERT INTO `t_operate_log` VALUES ('125', '登陆系统', '2018-04-04 16:52:15', '24');
INSERT INTO `t_operate_log` VALUES ('126', '登陆系统', '2018-04-04 16:52:42', '23');
INSERT INTO `t_operate_log` VALUES ('127', '添加了药品:虫皮完', '2018-04-04 16:54:07', '24');
INSERT INTO `t_operate_log` VALUES ('128', '退出了系统', '2018-04-04 16:57:47', '23');
INSERT INTO `t_operate_log` VALUES ('129', '登陆系统', '2018-04-04 16:58:19', '23');
INSERT INTO `t_operate_log` VALUES ('130', '退出了系统', '2018-04-04 16:58:30', '23');
INSERT INTO `t_operate_log` VALUES ('131', '添加用户:kfgl', '2018-04-04 16:58:34', '12');
INSERT INTO `t_operate_log` VALUES ('132', '登陆系统', '2018-04-04 16:58:45', '25');
INSERT INTO `t_operate_log` VALUES ('133', '退出了系统', '2018-04-04 16:58:52', '25');
INSERT INTO `t_operate_log` VALUES ('134', '登陆系统', '2018-04-04 16:59:02', '23');
INSERT INTO `t_operate_log` VALUES ('135', '添加用户:zqgl', '2018-04-04 16:59:41', '12');
INSERT INTO `t_operate_log` VALUES ('136', '登陆系统', '2018-04-04 17:04:39', '23');
INSERT INTO `t_operate_log` VALUES ('137', '登陆系统', '2018-04-04 17:04:49', '12');
INSERT INTO `t_operate_log` VALUES ('138', '添加虫害:知了', '2018-04-04 17:05:16', '23');
INSERT INTO `t_operate_log` VALUES ('139', '添加病害:叶黄病', '2018-04-04 17:07:05', '23');
INSERT INTO `t_operate_log` VALUES ('140', '添加用户:zjgl', '2018-04-04 17:07:58', '12');
INSERT INTO `t_operate_log` VALUES ('141', '添加鼠害:大田鼠', '2018-04-04 17:08:46', '23');
INSERT INTO `t_operate_log` VALUES ('142', '退出了系统', '2018-04-04 17:08:56', '23');
INSERT INTO `t_operate_log` VALUES ('143', '登陆系统', '2018-04-04 17:09:28', '26');
INSERT INTO `t_operate_log` VALUES ('144', '添加区域:交警宿舍', '2018-04-04 17:09:55', '26');
INSERT INTO `t_operate_log` VALUES ('145', '添加班级成都交警大队4队', '2018-04-04 17:11:27', '26');
INSERT INTO `t_operate_log` VALUES ('146', '添加灾害事件:交警宿舍猫害', '2018-04-04 17:12:39', '26');
INSERT INTO `t_operate_log` VALUES ('147', '退出了系统', '2018-04-04 17:12:50', '26');
INSERT INTO `t_operate_log` VALUES ('148', '登陆系统', '2018-04-04 17:13:01', '27');
INSERT INTO `t_operate_log` VALUES ('149', '退出了系统', '2018-04-04 17:13:20', '1');
INSERT INTO `t_operate_log` VALUES ('150', '登陆系统', '2018-04-04 17:14:01', '5');
INSERT INTO `t_operate_log` VALUES ('151', '添加专家:捕猫专家', '2018-04-04 17:14:14', '27');
INSERT INTO `t_operate_log` VALUES ('152', '修改了专家:王五的信息', '2018-04-04 17:14:39', '27');
INSERT INTO `t_operate_log` VALUES ('153', '对事件:绵阳小龙虾泛滥事件申请专家会商', '2018-04-04 17:14:53', '5');
INSERT INTO `t_operate_log` VALUES ('154', '退出了系统', '2018-04-04 17:17:41', '27');
INSERT INTO `t_operate_log` VALUES ('155', '登陆系统', '2018-04-04 17:18:07', '23');
INSERT INTO `t_operate_log` VALUES ('156', '添加虫害:测试', '2018-04-04 17:18:42', '23');
INSERT INTO `t_operate_log` VALUES ('157', '退出了系统', '2018-04-04 17:19:52', '2');
INSERT INTO `t_operate_log` VALUES ('158', '登陆系统', '2018-04-04 17:22:49', '23');
INSERT INTO `t_operate_log` VALUES ('159', '退出了系统', '2018-04-04 17:22:57', '23');
INSERT INTO `t_operate_log` VALUES ('160', '登陆系统', '2018-04-04 17:23:06', '23');
INSERT INTO `t_operate_log` VALUES ('161', '登陆系统', '2018-04-04 17:24:33', '12');
INSERT INTO `t_operate_log` VALUES ('162', '添加区域:test', '2018-04-04 17:25:16', '12');
INSERT INTO `t_operate_log` VALUES ('163', '添加班级test1', '2018-04-04 17:25:51', '12');
INSERT INTO `t_operate_log` VALUES ('164', '登陆系统', '2018-04-04 17:26:48', '12');
INSERT INTO `t_operate_log` VALUES ('165', '对事件:交警宿舍猫害申请专家会商', '2018-04-04 17:28:17', '12');
INSERT INTO `t_operate_log` VALUES ('166', '对灾害事件:交警宿舍猫害,添加专家会商信息', '2018-04-04 17:28:38', '12');
INSERT INTO `t_operate_log` VALUES ('167', '对事件:交警宿舍猫害申请专家会商', '2018-04-04 17:31:04', '12');
INSERT INTO `t_operate_log` VALUES ('168', '修改了灾情:交警宿舍猫害的信息', '2018-04-04 17:31:45', '12');
INSERT INTO `t_operate_log` VALUES ('169', '添加了药品:敌敌畏', '2018-04-04 17:32:11', '12');
INSERT INTO `t_operate_log` VALUES ('170', '领取了物品', '2018-04-04 17:33:10', '12');
INSERT INTO `t_operate_log` VALUES ('171', '登陆系统', '2018-04-04 17:36:25', '24');
INSERT INTO `t_operate_log` VALUES ('172', '登陆系统', '2018-04-04 17:37:23', '12');
INSERT INTO `t_operate_log` VALUES ('173', '登陆系统', '2018-04-04 17:37:58', '1');
INSERT INTO `t_operate_log` VALUES ('174', '登陆系统', '2018-04-04 17:53:38', '24');
INSERT INTO `t_operate_log` VALUES ('175', '登陆系统', '2018-04-04 18:32:52', '12');
INSERT INTO `t_operate_log` VALUES ('176', '登陆系统', '2018-04-04 18:34:18', '12');

-- ----------------------------
-- Table structure for t_stockout_detal
-- ----------------------------
DROP TABLE IF EXISTS `t_stockout_detal`;
CREATE TABLE `t_stockout_detal` (
  `sdtl_id` int(11) NOT NULL AUTO_INCREMENT,
  `sdtl_num` int(11) DEFAULT NULL,
  `sdtl_med_id` int(11) DEFAULT NULL,
  `sdtl_slog_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`sdtl_id`),
  KEY `sdtl_med_id` (`sdtl_med_id`),
  KEY `sdtl_slog_id` (`sdtl_slog_id`),
  CONSTRAINT `t_stockout_detal_ibfk_1` FOREIGN KEY (`sdtl_med_id`) REFERENCES `t_medicine` (`med_id`),
  CONSTRAINT `t_stockout_detal_ibfk_2` FOREIGN KEY (`sdtl_slog_id`) REFERENCES `t_stockout_log` (`slog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_stockout_detal
-- ----------------------------
INSERT INTO `t_stockout_detal` VALUES ('1', '2000', '2', '2');
INSERT INTO `t_stockout_detal` VALUES ('2', '2000', '2', '3');
INSERT INTO `t_stockout_detal` VALUES ('3', '2000', '3', '2');
INSERT INTO `t_stockout_detal` VALUES ('4', '2000', '2', '4');
INSERT INTO `t_stockout_detal` VALUES ('5', '2000', '4', '2');
INSERT INTO `t_stockout_detal` VALUES ('6', '2000', '6', '2');
INSERT INTO `t_stockout_detal` VALUES ('7', '2000', '3', '1');
INSERT INTO `t_stockout_detal` VALUES ('8', '2000', '4', '5');
INSERT INTO `t_stockout_detal` VALUES ('9', '2000', '7', '6');
INSERT INTO `t_stockout_detal` VALUES ('10', '2000', '6', '7');
INSERT INTO `t_stockout_detal` VALUES ('11', '2000', '10', '8');
INSERT INTO `t_stockout_detal` VALUES ('12', '2000', '8', '9');
INSERT INTO `t_stockout_detal` VALUES ('13', '2000', '4', '10');
INSERT INTO `t_stockout_detal` VALUES ('14', '2000', '6', '3');
INSERT INTO `t_stockout_detal` VALUES ('15', '2000', '5', '3');
INSERT INTO `t_stockout_detal` VALUES ('16', '200', '1', '11');
INSERT INTO `t_stockout_detal` VALUES ('17', '300', '2', '11');
INSERT INTO `t_stockout_detal` VALUES ('18', '200', '1', '12');
INSERT INTO `t_stockout_detal` VALUES ('19', '300', '2', '12');
INSERT INTO `t_stockout_detal` VALUES ('20', '200', '1', '13');
INSERT INTO `t_stockout_detal` VALUES ('21', '300', '2', '13');
INSERT INTO `t_stockout_detal` VALUES ('22', '200', '1', '14');
INSERT INTO `t_stockout_detal` VALUES ('23', '300', '2', '14');
INSERT INTO `t_stockout_detal` VALUES ('25', '500', '3', '2');
INSERT INTO `t_stockout_detal` VALUES ('26', '12', '1', '15');
INSERT INTO `t_stockout_detal` VALUES ('27', '23', '2', '15');
INSERT INTO `t_stockout_detal` VALUES ('28', '45', '3', '15');
INSERT INTO `t_stockout_detal` VALUES ('32', '55', '17', '16');
INSERT INTO `t_stockout_detal` VALUES ('33', '65', '15', '16');
INSERT INTO `t_stockout_detal` VALUES ('34', '55', '1', '17');
INSERT INTO `t_stockout_detal` VALUES ('35', '66', '3', '17');
INSERT INTO `t_stockout_detal` VALUES ('36', '77', '5', '17');
INSERT INTO `t_stockout_detal` VALUES ('40', '12', '3', '18');
INSERT INTO `t_stockout_detal` VALUES ('41', '45', '8', '18');
INSERT INTO `t_stockout_detal` VALUES ('42', '56', '15', '18');
INSERT INTO `t_stockout_detal` VALUES ('43', '45', '2', '19');
INSERT INTO `t_stockout_detal` VALUES ('44', '56', '3', '19');
INSERT INTO `t_stockout_detal` VALUES ('45', '88', '2', '20');
INSERT INTO `t_stockout_detal` VALUES ('46', '11', '21', '21');
INSERT INTO `t_stockout_detal` VALUES ('47', '90000', '23', '22');
INSERT INTO `t_stockout_detal` VALUES ('48', '1', '23', '23');
INSERT INTO `t_stockout_detal` VALUES ('49', '2', '28', '23');
INSERT INTO `t_stockout_detal` VALUES ('50', '3', '29', '23');

-- ----------------------------
-- Table structure for t_stockout_log
-- ----------------------------
DROP TABLE IF EXISTS `t_stockout_log`;
CREATE TABLE `t_stockout_log` (
  `slog_id` int(11) NOT NULL AUTO_INCREMENT,
  `slog_date` date DEFAULT NULL,
  `slog_cls_id` int(11) DEFAULT NULL,
  `slog_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`slog_id`),
  KEY `slog_cls_id` (`slog_cls_id`),
  KEY `slog_user_id` (`slog_user_id`),
  CONSTRAINT `t_stockout_log_ibfk_1` FOREIGN KEY (`slog_cls_id`) REFERENCES `t_class` (`cls_id`),
  CONSTRAINT `t_stockout_log_ibfk_2` FOREIGN KEY (`slog_user_id`) REFERENCES `t_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_stockout_log
-- ----------------------------
INSERT INTO `t_stockout_log` VALUES ('1', '2018-03-01', '1', '1');
INSERT INTO `t_stockout_log` VALUES ('2', '2018-03-30', '2', '3');
INSERT INTO `t_stockout_log` VALUES ('3', '2018-03-13', '2', '2');
INSERT INTO `t_stockout_log` VALUES ('4', '2018-03-20', '2', '2');
INSERT INTO `t_stockout_log` VALUES ('5', '2018-03-07', '3', '2');
INSERT INTO `t_stockout_log` VALUES ('6', '2018-03-29', '4', '4');
INSERT INTO `t_stockout_log` VALUES ('7', '2018-03-14', '3', '4');
INSERT INTO `t_stockout_log` VALUES ('8', '2018-03-18', '3', '2');
INSERT INTO `t_stockout_log` VALUES ('9', '2018-03-15', '3', '2');
INSERT INTO `t_stockout_log` VALUES ('10', '2018-03-14', '2', '4');
INSERT INTO `t_stockout_log` VALUES ('11', '2018-04-02', '2', '2');
INSERT INTO `t_stockout_log` VALUES ('12', '2018-04-02', '2', '2');
INSERT INTO `t_stockout_log` VALUES ('13', '2018-04-02', '2', '2');
INSERT INTO `t_stockout_log` VALUES ('14', '2018-04-02', '2', '2');
INSERT INTO `t_stockout_log` VALUES ('15', '2018-04-04', '1', '5');
INSERT INTO `t_stockout_log` VALUES ('16', '2018-04-04', '1', '5');
INSERT INTO `t_stockout_log` VALUES ('17', '2018-04-04', '1', '5');
INSERT INTO `t_stockout_log` VALUES ('18', '2018-04-04', '1', '5');
INSERT INTO `t_stockout_log` VALUES ('19', '2018-04-04', '1', '5');
INSERT INTO `t_stockout_log` VALUES ('20', '2018-04-04', '1', '12');
INSERT INTO `t_stockout_log` VALUES ('21', '2018-04-04', '1', '12');
INSERT INTO `t_stockout_log` VALUES ('22', '2018-04-04', '1', '12');
INSERT INTO `t_stockout_log` VALUES ('23', '2018-04-04', '22', '12');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL,
  `user_pwd` varchar(20) DEFAULT NULL,
  `user_rname` varchar(20) DEFAULT NULL,
  `user_grant` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `weiyi` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'U001', '123', '赵一', '1');
INSERT INTO `t_user` VALUES ('2', 'U002', '666', '钱二', '2');
INSERT INTO `t_user` VALUES ('3', 'U003', '123', '孙三', '3');
INSERT INTO `t_user` VALUES ('4', 'U004', '123', '李四', '4');
INSERT INTO `t_user` VALUES ('5', 'U005', '123', '王五', '5');
INSERT INTO `t_user` VALUES ('6', 'U006', '123', '孙六', '1');
INSERT INTO `t_user` VALUES ('7', 'U007', '123', '周七', '2');
INSERT INTO `t_user` VALUES ('8', 'U008', '123', '吴八', '3');
INSERT INTO `t_user` VALUES ('9', 'U009', '123', '郑九', '4');
INSERT INTO `t_user` VALUES ('12', 'luhao', '123456', '路昊', '1');
INSERT INTO `t_user` VALUES ('21', 'U010', '123', '冯十', '5');
INSERT INTO `t_user` VALUES ('23', 'zlgl', '123', '资料管理员', '2');
INSERT INTO `t_user` VALUES ('24', 'wuchenhan', '123456', '伍宸汉', '5');
INSERT INTO `t_user` VALUES ('25', 'kfgl', '123', 'kefang', '5');
INSERT INTO `t_user` VALUES ('26', 'zqgl', '123', '灾情', '3');
INSERT INTO `t_user` VALUES ('27', 'zjgl', '123', '专家', '4');
DROP TRIGGER IF EXISTS `stock_manager`;
DELIMITER ;;
CREATE TRIGGER `stock_manager` AFTER INSERT ON `t_stockout_detal` FOR EACH ROW BEGIN
	update t_medicine set med_stock = med_stock - new.sdtl_num where med_id = new.sdtl_med_id;
end
;;
DELIMITER ;
