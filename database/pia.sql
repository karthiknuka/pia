/*
SQLyog Community v11.52 (64 bit)
MySQL - 5.5.30 : Database - pia
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pia` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `pia`;

/*Table structure for table `addinggroups` */

DROP TABLE IF EXISTS `addinggroups`;

CREATE TABLE `addinggroups` (
  `groupname` varchar(30) DEFAULT NULL,
  `pubkey` varchar(1000) DEFAULT NULL,
  `prikey` varchar(1000) DEFAULT NULL,
  `pk` blob,
  `sk` blob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `addinggroups` */

insert  into `addinggroups`(`groupname`,`pubkey`,`prikey`,`pk`,`sk`) values ('group1','Sun EC public key, 163 bits\n  public x coord: 976965344753391879341260223233690119631913756080\n  public y coord: 8394295697601713453716215006585738761460155294947\n  parameters: sect163k1 [NIST K-163] (1.3.132.0.1)','sun.security.ec.ECPrivateKeyImpl@1720','0@0*ÜHŒ=+Å\0,\0\0´ §%DS¨&ŒñK‘ÈOÈ&¨\"%∞æ]<…(>˙Mõû≠ôn\'Xí$„','03\00*ÜHŒ=+Å\00\Zï÷Nn§Nˇ–Ô1Ô¯ˇÁ»:9'),('group2','Sun EC public key, 163 bits\n  public x coord: 2369114218401215153059831794622625041507996225667\n  public y coord: 7852457842429519318865343364049627619221632163434\n  parameters: sect163k1 [NIST K-163] (1.3.132.0.1)','sun.security.ec.ECPrivateKeyImpl@ffffffae','0@0*ÜHŒ=+Å\0,\0û˙¡vu^4„ã˝›&5PÉ_tc@ù{—TQ•wET[W;ûj','03\00*ÜHŒ=+Å\00\Z\n%Çÿs#j?ÖîÁ˙f9ãØ'),('group3','Sun EC public key, 163 bits\n  public x coord: 738006735465392445343150554201906792256343516489\n  public y coord: 10155133769000537676063909108120154405093920416637\n  parameters: sect163k1 [NIST K-163] (1.3.132.0.1)','sun.security.ec.ECPrivateKeyImpl@ffffe83a','0@0*ÜHŒ=+Å\0,\0\0ÅE]◊Z‡ˇôﬂ¶èÕÎV2%IÚÀÚáC¢ë≈Œî∆¶\Z\Zé#}','03\00*ÜHŒ=+Å\00\Z¥d!XáÕ°*cˆ\"ø≥]ôŒ˝Ã'),('group4','Sun EC public key, 163 bits\n  public x coord: 6003532055284792954136277597287191474415799180543\n  public y coord: 6816780846397627051620304920714530876379757825604\n  parameters: sect163k1 [NIST K-163] (1.3.132.0.1)','sun.security.ec.ECPrivateKeyImpl@fffff55e','0@0*ÜHŒ=+Å\0,\0ó∞ÎbÁŒ≈úÅc(≈-mBÖˇ™gUø§<†w);°ÔND','03\00*ÜHŒ=+Å\00\ZQ3ûk15%·é∂1µ¡å¡SF;ì');

/*Table structure for table `cloud` */

DROP TABLE IF EXISTS `cloud`;

CREATE TABLE `cloud` (
  `fid` varchar(100) DEFAULT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `plaintext` blob,
  `signature` blob,
  `groupname` varchar(100) DEFAULT NULL,
  `secretkeys` varchar(10000) DEFAULT NULL,
  `pubkey` varchar(1000) DEFAULT NULL,
  `pk` blob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cloud` */

insert  into `cloud`(`fid`,`fname`,`plaintext`,`signature`,`groupname`,`secretkeys`,`pubkey`,`pk`) values ('1','star.txt','<%@page import=\"java.util.*\"%><%Enumeration paramNames = request.getParameterNames(); while(paramNames.hasMoreElements())         {            String paramName = (String)paramNames.nextElement();            out.print(\"<tr><td>\" + paramName + \"\\n<td>\");            String[] paramValues = request.getParameterValues(paramName);            if (paramValues.length == 1)             {                String paramValue = paramValues[0];                if (paramValue.length() == 0)                    out.println(\"No Value\");                else                    out.println(paramValue);            }             else            {                out.println(\"<ul>\");                for(int i=0; i<paramValues.length; i++)                 {                    out.println(\"<li>dfgdfg\" + paramValues[i] + \"</li>\");                }                out.println(\"</ul>\");            }        }  %>','0-N™GhÆÒŸ–ˇ¶övÑP\Z!Y\0ƒÏ;H%¥•Vπ◊Ÿœ‡:©OÔÀ','group1','sun.security.ec.ECPrivateKeyImpl@45ef#','Sun EC public key, 163 bits  public x coord: 976965344753391879341260223233690119631913756080  public y coord: 8394295697601713453716215006585738761460155294947  parameters: sect163k1 [NIST K-163] (1.3.132.0.1)','0@0*ÜHŒ=+Å\0,\0\0´ §%DS¨&ŒñK‘ÈOÈ&¨\"%∞æ]<…(>˙Mõû≠ôn\'Xí$„');

/*Table structure for table `tpa` */

DROP TABLE IF EXISTS `tpa`;

CREATE TABLE `tpa` (
  `fid` varchar(100) DEFAULT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `groupname` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tpa` */

insert  into `tpa`(`fid`,`fname`,`groupname`,`status`) values ('1','star.txt','group1','Real Data');

/*Table structure for table `usercloud` */

DROP TABLE IF EXISTS `usercloud`;

CREATE TABLE `usercloud` (
  `fileid` varchar(100) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `filedata` blob,
  `encrypdata` blob,
  `groupname` varchar(100) DEFAULT NULL,
  `ugpubkey` varchar(1000) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `usercloud` */

/*Table structure for table `userreg` */

DROP TABLE IF EXISTS `userreg`;

CREATE TABLE `userreg` (
  `name` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact` varchar(10) DEFAULT NULL,
  `groupname` varchar(30) DEFAULT NULL,
  `pubkey` varchar(1000) DEFAULT NULL,
  `prikey` varchar(1000) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `agk` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `userreg` */

insert  into `userreg`(`name`,`username`,`password`,`email`,`contact`,`groupname`,`pubkey`,`prikey`,`status`,`agk`) values ('ali','ali','ali','aliincloudtechnologies@gmail.com','8985025070','group1','Sun EC public key, 192 bits\n  public x coord: 1907576762272700808453723862850643515160255553541950959517\n  public y coord: 3440490603243704248338073831272694823090910269991101704287\n  parameters: secp192k1 (1.3.132.0.31)','sun.security.ec.ECPrivateKeyImpl@45ef','revoke','sun.security.ec.ECPrivateKeyImpl@26b7'),('bhanutej','bhanu','k','bhanutej4u@gmail.com','8985025070','group1','Sun EC public key, 192 bits\n  public x coord: 466262739805740632708641576855961014928029932996397910087\n  public y coord: 1479140565185002607698637724200677216364559230793360279100\n  parameters: secp192k1 (1.3.132.0.31)','sun.security.ec.ECPrivateKeyImpl@59bf','normal','sun.security.ec.ECPrivateKeyImpl@be1'),('swamy','swamy','s','swamy@gmail.com','7417417410','group2','Sun EC public key, 192 bits\n  public x coord: 2892083069604855542194298910243962348512304330167404337695\n  public y coord: 2635056350634847489180853820700377833679397903601178442424\n  parameters: secp192k1 (1.3.132.0.31)','sun.security.ec.ECPrivateKeyImpl@8442','normal',NULL),('sajid','sajid','s','sajid@gmail.com','9639639630','group2','Sun EC public key, 192 bits\n  public x coord: 1291862643800550207373046712602787464791275437783723151352\n  public y coord: 4997546012312740826178287232361035815042813207532388933177\n  parameters: secp192k1 (1.3.132.0.31)','sun.security.ec.ECPrivateKeyImpl@ffffa628','normal',NULL),('ram','ram','r','rama@gmail.com','8528528520','group1','Sun EC public key, 192 bits\n  public x coord: 1046156417684233388714925454590025706136638291189288421761\n  public y coord: 974340729334929547757587330170588462972974384547746971779\n  parameters: secp192k1 (1.3.132.0.31)','sun.security.ec.ECPrivateKeyImpl@ffffe8e8','revoke','sun.security.ec.ECPrivateKeyImpl@26b7'),('ravi','ravi','r','ravi@gmail.com','9879879870','group1','Sun EC public key, 192 bits\n  public x coord: 2114338981154385142839993576062595090325732752516785128874\n  public y coord: 6152528695381130693668048212932553093815491968693466374831\n  parameters: secp192k1 (1.3.132.0.31)','sun.security.ec.ECPrivateKeyImpl@ffffd5e5','normal','sun.security.ec.ECPrivateKeyImpl@be1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
