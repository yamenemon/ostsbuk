-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 15, 2023 at 05:01 PM
-- Server version: 8.0.35-0ubuntu0.20.04.1
-- PHP Version: 8.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `osticket23`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`admin`@`localhost` PROCEDURE `ost_CreateInventoryFormFields` ()  BEGIN
    SET @form_id = (SELECT id FROM `ost_form` WHERE `title`='Inventory');
    SET @location_list = (SELECT id FROM `ost_list` WHERE `name`='Location');

    INSERT INTO `ost_form_field`
    (`form_id`,
     `flags`,
     `type`,
     `label`,
     `name`,
     `sort`,
     `created`,
     `updated`)
    VALUES
        (@form_id,
         28673,
         'text',
         'Hostname',
         'host_name',
         1,
         NOW(),
         NOW());
    INSERT INTO `ost_form_field`
    (`form_id`,
     `flags`,
     `type`,
     `label`,
     `name`,
     `sort`,
     `created`,
     `updated`)
    VALUES
        (@form_id,
         20481,
         'text',
         'Manufacturer',
         'manufacturer',
         2,
         NOW(),
         NOW());
    INSERT INTO `ost_form_field`
    (`form_id`,
     `flags`,
     `type`,
     `label`,
     `name`,
     `sort`,
     `created`,
     `updated`)
    VALUES
        (@form_id,
         20481,
         'text',
         'Model',
         'model',
         3,
         NOW(),
         NOW());
    INSERT INTO `ost_form_field`
    (`form_id`,
     `flags`,
     `type`,
     `label`,
     `name`,
     `sort`,
     `created`,
     `updated`)
    VALUES
        (@form_id,
         20481,
         'text',
         'Serial',
         'serial_number',
         4,
         NOW(),
         NOW());
    INSERT INTO `ost_form_field`
    (`form_id`,
     `flags`,
     `type`,
     `label`,
     `name`,
     `sort`,
     `created`,
     `updated`)
    VALUES
        (@form_id,
         12289,
         'text',
         'Location',
         'location',
         5,
         NOW(),
         NOW());
    INSERT INTO `ost_form_field`
    (`form_id`,
     `flags`,
     `type`,
     `label`,
     `name`,
     `sort`,
     `created`,
     `updated`)
    VALUES
        (@form_id,
         0,
         'text',
         'Assignee',
         'assignee',
         6,
         NOW(),
         NOW());
    END$$

CREATE DEFINER=`admin`@`localhost` PROCEDURE `ost_CreateInventoryQueue` ()  BEGIN

INSERT INTO `ost_queue`
(`id`,
 `parent_id`,
 `columns_id`,
 `sort_id`,
 `flags`,
 `staff_id`,
 `sort`,
 `title`,
 `config`,
 `filter`,
 `root`,
 `path`,
 `created`,
 `updated`)
VALUES
    (101,
     0,
     NULL,
     8,
     47,
     0,
     7,
     'Assets',
     '[]',
     NULL,
     'U',
     '/',
     NOW(),
     NOW());
END$$

CREATE DEFINER=`admin`@`localhost` PROCEDURE `ost_CreateInventoryQueueColumns` ()  BEGIN

INSERT INTO `ost_queue_column`
(`flags`,
 `name`,
 `primary`,
 `secondary`,
 `filter`,
 `truncate`,
 `annotations`,
 `conditions`,
 `extra`)
VALUES
    (0,
     'Hostname',
     'host_name',
     NULL,
     'link:assetP',
     '',
     '[]',
     '[]',
     NULL);
INSERT INTO `ost_queue_column`
(`flags`,
 `name`,
 `primary`,
 `secondary`,
 `filter`,
 `truncate`,
 `annotations`,
 `conditions`,
 `extra`)
VALUES
    (0,
     'Model',
     'model',
     NULL,
     NULL,
     '',
     '[]',
     '[]',
     NULL);
INSERT INTO `ost_queue_column`
(`flags`,
 `name`,
 `primary`,
 `secondary`,
 `filter`,
 `truncate`,
 `annotations`,
 `conditions`,
 `extra`)
VALUES
    (0,
     'Assignee',
     'assignee',
     NULL,
     'link:assignee',
     '',
     '[]',
     '[]',
     NULL);
INSERT INTO `ost_queue_column`
(`flags`,
 `name`,
 `primary`,
 `secondary`,
 `filter`,
 `truncate`,
 `annotations`,
 `conditions`,
 `extra`)
VALUES
    (0,
     'Location',
     'location',
     NULL,
     NULL,
     '',
     '[]',
     '[]',
     NULL);
END$$

CREATE DEFINER=`admin`@`localhost` PROCEDURE `ost_CreateInventoryQueueColumnsTable` ()  BEGIN

    SET @queue_id = (SELECT `id` FROM `ost_queue` WHERE `title`='Assets');
    SET @hostname_id = (SELECT `id` FROM `ost_queue_column` WHERE `name`='Hostname');
    SET @model_id = (SELECT `id` FROM `ost_queue_column` WHERE `name`='Model');
    SET @assignee_id = (SELECT `id` FROM `ost_queue_column` WHERE `name`='Assignee');
    SET @location_id = (SELECT `id` FROM `ost_queue_column` WHERE `name`='Location');

INSERT INTO `ost_queue_columns`
(`queue_id`,
 `column_id`,
 `staff_id`,
 `bits`,
 `sort`,
 `heading`,
 `width`)
VALUES
    (@queue_id,
     @hostname_id,
     0,
     1,
     1,
     'Hostname',
     230);
INSERT INTO `ost_queue_columns`
(`queue_id`,
 `column_id`,
 `staff_id`,
 `bits`,
 `sort`,
 `heading`,
 `width`)
VALUES
    (@queue_id,
     @model_id,
     0,
     1,
     2,
     'Model',
     230);
INSERT INTO `ost_queue_columns`
(`queue_id`,
 `column_id`,
 `staff_id`,
 `bits`,
 `sort`,
 `heading`,
 `width`)
VALUES
    (@queue_id,
     @assignee_id,
     0,
     1,
     3,
     'Assignee',
     230);
INSERT INTO `ost_queue_columns`
(`queue_id`,
 `column_id`,
 `staff_id`,
 `bits`,
 `sort`,
 `heading`,
 `width`)
VALUES
    (@queue_id,
     @location_id,
     0,
     1,
     4,
     'Location',
     230);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ost_api_key`
--

CREATE TABLE `ost_api_key` (
  `id` int UNSIGNED NOT NULL,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `ipaddr` varchar(64) NOT NULL,
  `apikey` varchar(255) NOT NULL,
  `can_create_tickets` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `can_exec_cron` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `notes` text,
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_attachment`
--

CREATE TABLE `ost_attachment` (
  `id` int UNSIGNED NOT NULL,
  `object_id` int UNSIGNED NOT NULL,
  `type` char(1) NOT NULL,
  `file_id` int UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `inline` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `lang` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_attachment`
--

INSERT INTO `ost_attachment` (`id`, `object_id`, `type`, `file_id`, `name`, `inline`, `lang`) VALUES
(1, 1, 'C', 2, NULL, 0, NULL),
(2, 8, 'T', 1, NULL, 1, NULL),
(3, 9, 'T', 1, NULL, 1, NULL),
(4, 10, 'T', 1, NULL, 1, NULL),
(5, 11, 'T', 1, NULL, 1, NULL),
(6, 12, 'T', 1, NULL, 1, NULL),
(7, 13, 'T', 1, NULL, 1, NULL),
(8, 14, 'T', 1, NULL, 1, NULL),
(9, 16, 'T', 1, NULL, 1, NULL),
(10, 17, 'T', 1, NULL, 1, NULL),
(11, 18, 'T', 1, NULL, 1, NULL),
(12, 19, 'T', 1, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ost_canned_response`
--

CREATE TABLE `ost_canned_response` (
  `canned_id` int UNSIGNED NOT NULL,
  `dept_id` int UNSIGNED NOT NULL DEFAULT '0',
  `isenabled` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL DEFAULT '',
  `response` text NOT NULL,
  `lang` varchar(16) NOT NULL DEFAULT 'en_US',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_canned_response`
--

INSERT INTO `ost_canned_response` (`canned_id`, `dept_id`, `isenabled`, `title`, `response`, `lang`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 'What is osTicket (sample)?', 'osTicket is a widely-used open source support ticket system, an\nattractive alternative to higher-cost and complex customer support\nsystems - simple, lightweight, reliable, open source, web-based and easy\nto setup and use.', 'en_US', NULL, '2023-12-15 19:44:53', '2023-12-15 19:44:53'),
(2, 0, 1, 'Sample (with variables)', 'Hi %{ticket.name.first},\n<br>\n<br>\nYour ticket #%{ticket.number} created on %{ticket.create_date} is in\n%{ticket.dept.name} department.', 'en_US', NULL, '2023-12-15 19:44:53', '2023-12-15 19:44:53');

-- --------------------------------------------------------

--
-- Table structure for table `ost_config`
--

CREATE TABLE `ost_config` (
  `id` int UNSIGNED NOT NULL,
  `namespace` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_config`
--

INSERT INTO `ost_config` (`id`, `namespace`, `key`, `value`, `updated`) VALUES
(1, 'core', 'admin_email', 'robin.zitf@gmail.com', '2023-12-15 13:45:04'),
(2, 'core', 'helpdesk_url', 'http://dev.osticket:8080/', '2023-12-15 13:45:05'),
(3, 'core', 'helpdesk_title', 'SBUK', '2023-12-15 13:45:05'),
(4, 'core', 'schema_signature', '83a22ba22b1a6a624fcb1da03882ac1b', '2023-12-15 13:45:04'),
(5, 'schedule.1', 'configuration', '{\"holidays\":[4]}', '2023-12-15 13:44:49'),
(6, 'core', 'time_format', 'hh:mm a', '2023-12-15 13:44:50'),
(7, 'core', 'date_format', 'MM/dd/y', '2023-12-15 13:44:50'),
(8, 'core', 'datetime_format', 'MM/dd/y h:mm a', '2023-12-15 13:44:50'),
(9, 'core', 'daydatetime_format', 'EEE, MMM d y h:mm a', '2023-12-15 13:44:50'),
(10, 'core', 'default_priority_id', '2', '2023-12-15 13:44:50'),
(11, 'core', 'enable_daylight_saving', '', '2023-12-15 13:44:50'),
(12, 'core', 'reply_separator', '-- reply above this line --', '2023-12-15 13:44:50'),
(13, 'core', 'isonline', '1', '2023-12-15 13:44:50'),
(14, 'core', 'staff_ip_binding', '', '2023-12-15 13:44:50'),
(15, 'core', 'staff_max_logins', '4', '2023-12-15 13:44:50'),
(16, 'core', 'staff_login_timeout', '2', '2023-12-15 13:44:50'),
(17, 'core', 'staff_session_timeout', '30', '2023-12-15 13:44:50'),
(18, 'core', 'passwd_reset_period', '', '2023-12-15 13:44:50'),
(19, 'core', 'client_max_logins', '4', '2023-12-15 13:44:50'),
(20, 'core', 'client_login_timeout', '2', '2023-12-15 13:44:50'),
(21, 'core', 'client_session_timeout', '30', '2023-12-15 13:44:50'),
(22, 'core', 'max_page_size', '25', '2023-12-15 13:44:50'),
(23, 'core', 'max_open_tickets', '', '2023-12-15 13:44:50'),
(24, 'core', 'autolock_minutes', '3', '2023-12-15 13:44:50'),
(25, 'core', 'default_smtp_id', '', '2023-12-15 13:44:50'),
(26, 'core', 'use_email_priority', '', '2023-12-15 13:44:50'),
(27, 'core', 'enable_kb', '', '2023-12-15 13:44:50'),
(28, 'core', 'enable_premade', '1', '2023-12-15 13:44:50'),
(29, 'core', 'enable_captcha', '', '2023-12-15 13:44:50'),
(30, 'core', 'enable_auto_cron', '', '2023-12-15 13:44:50'),
(31, 'core', 'enable_mail_polling', '', '2023-12-15 13:44:50'),
(32, 'core', 'send_sys_errors', '1', '2023-12-15 13:44:50'),
(33, 'core', 'send_sql_errors', '1', '2023-12-15 13:44:50'),
(34, 'core', 'send_login_errors', '1', '2023-12-15 13:44:50'),
(35, 'core', 'save_email_headers', '1', '2023-12-15 13:44:50'),
(36, 'core', 'strip_quoted_reply', '1', '2023-12-15 13:44:50'),
(37, 'core', 'ticket_autoresponder', '', '2023-12-15 13:44:50'),
(38, 'core', 'message_autoresponder', '', '2023-12-15 13:44:50'),
(39, 'core', 'ticket_notice_active', '1', '2023-12-15 13:44:50'),
(40, 'core', 'ticket_alert_active', '1', '2023-12-15 13:44:51'),
(41, 'core', 'ticket_alert_admin', '1', '2023-12-15 13:44:51'),
(42, 'core', 'ticket_alert_dept_manager', '1', '2023-12-15 13:44:51'),
(43, 'core', 'ticket_alert_dept_members', '', '2023-12-15 13:44:51'),
(44, 'core', 'message_alert_active', '1', '2023-12-15 13:44:51'),
(45, 'core', 'message_alert_laststaff', '1', '2023-12-15 13:44:51'),
(46, 'core', 'message_alert_assigned', '1', '2023-12-15 13:44:51'),
(47, 'core', 'message_alert_dept_manager', '', '2023-12-15 13:44:51'),
(48, 'core', 'note_alert_active', '', '2023-12-15 13:44:51'),
(49, 'core', 'note_alert_laststaff', '1', '2023-12-15 13:44:51'),
(50, 'core', 'note_alert_assigned', '1', '2023-12-15 13:44:51'),
(51, 'core', 'note_alert_dept_manager', '', '2023-12-15 13:44:51'),
(52, 'core', 'transfer_alert_active', '', '2023-12-15 13:44:51'),
(53, 'core', 'transfer_alert_assigned', '', '2023-12-15 13:44:51'),
(54, 'core', 'transfer_alert_dept_manager', '1', '2023-12-15 13:44:51'),
(55, 'core', 'transfer_alert_dept_members', '', '2023-12-15 13:44:51'),
(56, 'core', 'overdue_alert_active', '1', '2023-12-15 13:44:51'),
(57, 'core', 'overdue_alert_assigned', '1', '2023-12-15 13:44:51'),
(58, 'core', 'overdue_alert_dept_manager', '1', '2023-12-15 13:44:51'),
(59, 'core', 'overdue_alert_dept_members', '', '2023-12-15 13:44:51'),
(60, 'core', 'assigned_alert_active', '1', '2023-12-15 13:44:51'),
(61, 'core', 'assigned_alert_staff', '1', '2023-12-15 13:44:51'),
(62, 'core', 'assigned_alert_team_lead', '', '2023-12-15 13:44:51'),
(63, 'core', 'assigned_alert_team_members', '', '2023-12-15 13:44:51'),
(64, 'core', 'auto_claim_tickets', '1', '2023-12-15 13:44:51'),
(65, 'core', 'auto_refer_closed', '1', '2023-12-15 13:44:51'),
(66, 'core', 'collaborator_ticket_visibility', '1', '2023-12-15 13:44:51'),
(67, 'core', 'require_topic_to_close', '', '2023-12-15 13:44:51'),
(68, 'core', 'show_related_tickets', '1', '2023-12-15 13:44:52'),
(69, 'core', 'show_assigned_tickets', '1', '2023-12-15 13:44:52'),
(70, 'core', 'show_answered_tickets', '', '2023-12-15 13:44:52'),
(71, 'core', 'hide_staff_name', '', '2023-12-15 13:44:52'),
(72, 'core', 'disable_agent_collabs', '', '2023-12-15 13:44:52'),
(73, 'core', 'overlimit_notice_active', '', '2023-12-15 13:44:52'),
(74, 'core', 'email_attachments', '1', '2023-12-15 13:44:52'),
(75, 'core', 'ticket_number_format', '######', '2023-12-15 13:44:52'),
(76, 'core', 'ticket_sequence_id', '', '2023-12-15 13:44:52'),
(77, 'core', 'queue_bucket_counts', '', '2023-12-15 13:44:52'),
(78, 'core', 'allow_external_images', '', '2023-12-15 13:44:52'),
(79, 'core', 'task_number_format', '#', '2023-12-15 13:44:52'),
(80, 'core', 'task_sequence_id', '2', '2023-12-15 13:44:52'),
(81, 'core', 'log_level', '2', '2023-12-15 13:44:52'),
(82, 'core', 'log_graceperiod', '12', '2023-12-15 13:44:52'),
(83, 'core', 'client_registration', 'public', '2023-12-15 13:44:52'),
(84, 'core', 'default_ticket_queue', '1', '2023-12-15 13:44:52'),
(85, 'core', 'embedded_domain_whitelist', 'youtube.com, dailymotion.com, vimeo.com, player.vimeo.com, web.microsoftstream.com', '2023-12-15 13:44:52'),
(86, 'core', 'max_file_size', '1048576', '2023-12-15 13:44:52'),
(87, 'core', 'landing_page_id', '1', '2023-12-15 13:44:52'),
(88, 'core', 'thank-you_page_id', '2', '2023-12-15 13:44:52'),
(89, 'core', 'offline_page_id', '3', '2023-12-15 13:44:53'),
(90, 'core', 'system_language', 'en_US', '2023-12-15 13:44:53'),
(91, 'mysqlsearch', 'reindex', '1', '2023-12-15 13:45:04'),
(92, 'core', 'default_email_id', '1', '2023-12-15 13:45:04'),
(93, 'core', 'alert_email_id', '2', '2023-12-15 13:45:04'),
(94, 'core', 'default_dept_id', '1', '2023-12-15 13:45:04'),
(95, 'core', 'default_sla_id', '1', '2023-12-15 13:45:04'),
(96, 'core', 'schedule_id', '1', '2023-12-15 13:45:04'),
(97, 'core', 'default_template_id', '1', '2023-12-15 13:45:04'),
(98, 'core', 'default_timezone', 'Asia/Dhaka', '2023-12-15 13:45:04'),
(99, 'plugin.1.instance.1', 'inventory_backend_enable', '1', '2023-12-15 15:01:36'),
(100, 'plugin.1.instance.1', 'inventory_custom_form', '{\"7\":\"Inventory\"}', '2023-12-15 15:01:41'),
(101, 'assetmysqlsearch', 'reindex', '0', '2023-12-15 15:06:24'),
(102, 'core', 'client_logo_id', '3', '2023-12-15 15:12:57'),
(103, 'core', 'staff_logo_id', '3', '2023-12-15 15:12:57'),
(104, 'core', 'staff_backdrop_id', '', '2023-12-15 15:12:47');

-- --------------------------------------------------------

--
-- Table structure for table `ost_content`
--

CREATE TABLE `ost_content` (
  `id` int UNSIGNED NOT NULL,
  `isactive` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT 'other',
  `name` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_content`
--

INSERT INTO `ost_content` (`id`, `isactive`, `type`, `name`, `body`, `notes`, `created`, `updated`) VALUES
(1, 1, 'landing', 'Landing', '<h1>Welcome to the Support Center</h1> <p> In order to streamline support requests and better serve you, we utilize a support ticket system. Every support request is assigned a unique ticket number which you can use to track the progress and responses online. For your reference we provide complete archives and history of all your support requests. A valid email address is required to submit a ticket. </p>', 'The Landing Page refers to the content of the Customer Portal\'s initial view. The template modifies the content seen above the two links <strong>Open a New Ticket</strong> and <strong>Check Ticket Status</strong>.', '2023-12-15 19:44:52', '2023-12-15 19:44:52'),
(2, 1, 'thank-you', 'Thank You', '<div>%{ticket.name},\n<br>\n<br>\nThank you for contacting us.\n<br>\n<br>\nA support ticket request has been created and a representative will be\ngetting back to you shortly if necessary.</p>\n<br>\n<br>\nSupport Team\n</div>', 'This template defines the content displayed on the Thank-You page after a\nClient submits a new ticket in the Client Portal.', '2023-12-15 19:44:52', '2023-12-15 19:44:52'),
(3, 1, 'offline', 'Offline', '<div><h1>\n<span style=\"font-size: medium\">Support Ticket System Offline</span>\n</h1>\n<p>Thank you for your interest in contacting us.</p>\n<p>Our helpdesk is offline at the moment, please check back at a later\ntime.</p>\n</div>', 'The Offline Page appears in the Customer Portal when the Help Desk is offline.', '2023-12-15 19:44:53', '2023-12-15 19:44:53'),
(4, 1, 'registration-staff', 'Welcome to osTicket', '<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> We\'ve created an account for you at our help desk at %{url}.<br /> <br /> Please follow the link below to confirm your account and gain access to your tickets.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System<br /> %{company.name}</em> </div>', 'This template defines the initial email (optional) sent to Agents when an account is created on their behalf.', '2023-12-15 19:44:53', '2023-12-15 19:44:53'),
(5, 1, 'pwreset-staff', 'osTicket Staff Password Reset', '<h3><strong>Hi %{staff.name.first},</strong></h3> <div> A password reset request has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> If you feel that this has been done in error, delete and disregard this email. Your account is still secure and no one has been given access to it. It is not locked and your password has not been reset. Someone could have mistakenly entered your email address.<br /> <br /> Follow the link below to login to the help desk and change your password.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width: 126px\" /> </div>', 'This template defines the email sent to Staff who select the <strong>Forgot My Password</strong> link on the Staff Control Panel Log In page.', '2023-12-15 19:44:53', '2023-12-15 19:44:53'),
(6, 1, 'banner-staff', 'Authentication Required', '', 'This is the initial message and banner shown on the Staff Log In page. The first input field refers to the red-formatted text that appears at the top. The latter textarea is for the banner content which should serve as a disclaimer.', '2023-12-15 19:44:53', '2023-12-15 19:44:53'),
(7, 1, 'registration-client', 'Welcome to %{company.name}', '<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> We\'ve created an account for you at our help desk at %{url}.<br /> <br /> Please follow the link below to confirm your account and gain access to your tickets.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System <br /> %{company.name}</em> </div>', 'This template defines the email sent to Clients when their account has been created in the Client Portal or by an Agent on their behalf. This email serves as an email address verification. Please use %{link} somewhere in the body.', '2023-12-15 19:44:53', '2023-12-15 19:44:53'),
(8, 1, 'pwreset-client', '%{company.name} Help Desk Access', '<h3><strong>Hi %{user.name.first},</strong></h3> <div> A password reset request has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> If you feel that this has been done in error, delete and disregard this email. Your account is still secure and no one has been given access to it. It is not locked and your password has not been reset. Someone could have mistakenly entered your email address.<br /> <br /> Follow the link below to login to the help desk and change your password.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System <br /> %{company.name}</em> </div>', 'This template defines the email sent to Clients who select the <strong>Forgot My Password</strong> link on the Client Log In page.', '2023-12-15 19:44:53', '2023-12-15 19:44:53'),
(9, 1, 'banner-client', 'Sign in to %{company.name}', 'To better serve you, we encourage our Clients to register for an account.', 'This composes the header on the Client Log In page. It can be useful to inform your Clients about your log in and registration policies.', '2023-12-15 19:44:53', '2023-12-15 19:44:53'),
(10, 1, 'registration-confirm', 'Account registration', '<div><strong>Thanks for registering for an account.</strong><br/> <br /> We\'ve just sent you an email to the address you entered. Please follow the link in the email to confirm your account and gain access to your tickets. </div>', 'This templates defines the page shown to Clients after completing the registration form. The template should mention that the system is sending them an email confirmation link and what is the next step in the registration process.', '2023-12-15 19:44:53', '2023-12-15 19:44:53'),
(11, 1, 'registration-thanks', 'Account Confirmed!', '<div> <strong>Thanks for registering for an account.</strong><br /> <br /> You\'ve confirmed your email address and successfully activated your account. You may proceed to open a new ticket or manage existing tickets.<br /> <br /> <em>Your friendly support center</em><br /> %{company.name} </div>', 'This template defines the content displayed after Clients successfully register by confirming their account. This page should inform the user that registration is complete and that the Client can now submit a ticket or access existing tickets.', '2023-12-15 19:44:53', '2023-12-15 19:44:53'),
(12, 1, 'access-link', 'Ticket [#%{ticket.number}] Access Link', '<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> An access link request for ticket #%{ticket.number} has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> Follow the link below to check the status of the ticket #%{ticket.number}.<br /> <br /> <a href=\"%{recipient.ticket_link}\">%{recipient.ticket_link}</a><br /> <br /> If you <strong>did not</strong> make the request, please delete and disregard this email. Your account is still secure and no one has been given access to the ticket. Someone could have mistakenly entered your email address.<br /> <br /> --<br /> %{company.name} </div>', 'This template defines the notification for Clients that an access link was sent to their email. The ticket number and email address trigger the access link.', '2023-12-15 19:44:53', '2023-12-15 19:44:53'),
(13, 1, 'email2fa-staff', 'osTicket Two Factor Authentication', '<h3><strong>Hi %{staff.name.first},</strong></h3> <div> You have just logged into for the helpdesk at %{url}.<br /> <br /> Use the verification code below to finish logging into the helpdesk.<br /> <br /> %{otp}<br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width: 126px\" /> </div>', 'This template defines the email sent to Staff who use Email for Two Factor Authentication', '2023-12-15 19:44:53', '2023-12-15 19:44:53');

-- --------------------------------------------------------

--
-- Table structure for table `ost_department`
--

CREATE TABLE `ost_department` (
  `id` int UNSIGNED NOT NULL,
  `pid` int UNSIGNED DEFAULT NULL,
  `tpl_id` int UNSIGNED NOT NULL DEFAULT '0',
  `sla_id` int UNSIGNED NOT NULL DEFAULT '0',
  `schedule_id` int UNSIGNED NOT NULL DEFAULT '0',
  `email_id` int UNSIGNED NOT NULL DEFAULT '0',
  `autoresp_email_id` int UNSIGNED NOT NULL DEFAULT '0',
  `manager_id` int UNSIGNED NOT NULL DEFAULT '0',
  `flags` int UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL DEFAULT '',
  `signature` text NOT NULL,
  `ispublic` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `group_membership` tinyint(1) NOT NULL DEFAULT '0',
  `ticket_auto_response` tinyint(1) NOT NULL DEFAULT '1',
  `message_auto_response` tinyint(1) NOT NULL DEFAULT '0',
  `path` varchar(128) NOT NULL DEFAULT '/',
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_department`
--

INSERT INTO `ost_department` (`id`, `pid`, `tpl_id`, `sla_id`, `schedule_id`, `email_id`, `autoresp_email_id`, `manager_id`, `flags`, `name`, `signature`, `ispublic`, `group_membership`, `ticket_auto_response`, `message_auto_response`, `path`, `updated`, `created`) VALUES
(1, NULL, 0, 0, 0, 0, 0, 0, 4, 'Support', 'Support Department', 1, 1, 1, 1, '/1/', '2023-12-15 19:44:20', '2023-12-15 19:44:20'),
(2, NULL, 0, 1, 0, 0, 0, 0, 4, 'Sales', 'Sales and Customer Retention', 1, 1, 1, 1, '/2/', '2023-12-15 19:44:20', '2023-12-15 19:44:20'),
(3, NULL, 0, 0, 0, 0, 0, 0, 4, 'Maintenance', 'Maintenance Department', 1, 0, 1, 1, '/3/', '2023-12-15 19:44:20', '2023-12-15 19:44:20');

-- --------------------------------------------------------

--
-- Table structure for table `ost_draft`
--

CREATE TABLE `ost_draft` (
  `id` int UNSIGNED NOT NULL,
  `staff_id` int UNSIGNED NOT NULL,
  `namespace` varchar(32) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `extra` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_email`
--

CREATE TABLE `ost_email` (
  `email_id` int UNSIGNED NOT NULL,
  `noautoresp` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `priority_id` int UNSIGNED NOT NULL DEFAULT '2',
  `dept_id` int UNSIGNED NOT NULL DEFAULT '0',
  `topic_id` int UNSIGNED NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_email`
--

INSERT INTO `ost_email` (`email_id`, `noautoresp`, `priority_id`, `dept_id`, `topic_id`, `email`, `name`, `notes`, `created`, `updated`) VALUES
(1, 0, 2, 1, 0, 'nzianit@gmail.com', 'Support', NULL, '2023-12-15 19:45:04', '2023-12-15 19:45:04'),
(2, 0, 2, 1, 0, 'alerts@gmail.com', 'osTicket Alerts', NULL, '2023-12-15 19:45:04', '2023-12-15 19:45:04'),
(3, 0, 2, 1, 0, 'noreply@gmail.com', '', NULL, '2023-12-15 19:45:04', '2023-12-15 19:45:04');

-- --------------------------------------------------------

--
-- Table structure for table `ost_email_account`
--

CREATE TABLE `ost_email_account` (
  `id` int UNSIGNED NOT NULL,
  `email_id` int UNSIGNED NOT NULL,
  `type` enum('mailbox','smtp') NOT NULL DEFAULT 'mailbox',
  `auth_bk` varchar(128) NOT NULL,
  `auth_id` varchar(16) DEFAULT NULL,
  `active` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `host` varchar(128) NOT NULL DEFAULT '',
  `port` int NOT NULL,
  `folder` varchar(255) DEFAULT NULL,
  `protocol` enum('IMAP','POP','SMTP','OTHER') NOT NULL DEFAULT 'OTHER',
  `encryption` enum('NONE','AUTO','SSL') NOT NULL DEFAULT 'AUTO',
  `fetchfreq` tinyint UNSIGNED NOT NULL DEFAULT '5',
  `fetchmax` tinyint UNSIGNED DEFAULT '30',
  `postfetch` enum('archive','delete','nothing') NOT NULL DEFAULT 'nothing',
  `archivefolder` varchar(255) DEFAULT NULL,
  `allow_spoofing` tinyint UNSIGNED DEFAULT '0',
  `num_errors` int UNSIGNED NOT NULL DEFAULT '0',
  `last_error_msg` tinytext,
  `last_error` datetime DEFAULT NULL,
  `last_activity` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_email_template`
--

CREATE TABLE `ost_email_template` (
  `id` int UNSIGNED NOT NULL,
  `tpl_id` int UNSIGNED NOT NULL,
  `code_name` varchar(32) NOT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_email_template`
--

INSERT INTO `ost_email_template` (`id`, `tpl_id`, `code_name`, `subject`, `body`, `notes`, `created`, `updated`) VALUES
(1, 1, 'ticket.autoresp', 'Support Ticket Opened [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> <p>A request for support has been created and assigned #%{ticket.number}. A representative will follow-up with you as soon as possible. You can <a href=\"%%7Brecipient.ticket_link%7D\">view this ticket\'s progress online</a>. </p> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team, <br /> %{signature} </div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small\"><em>If you wish to provide additional comments or information regarding the issue, please reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login to your account</span></a> for a complete archive of your support requests.</em></div>', NULL, '2023-12-15 19:44:54', '2023-12-15 19:44:54'),
(2, 1, 'ticket.autoreply', 'Re: %{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> A request for support has been created and assigned ticket <a href=\"%%7Brecipient.ticket_link%7D\">#%{ticket.number}</a> with the following automatic reply <br /> <br /> Topic: <strong>%{ticket.topic.name}</strong> <br /> Subject: <strong>%{ticket.subject}</strong> <br /> <br /> %{response} <br /> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature}</div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small\"><em>We hope this response has sufficiently answered your questions. If you wish to provide additional comments or information, please reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login to your account</span></a> for a complete archive of your support requests.</em></div>', NULL, '2023-12-15 19:44:54', '2023-12-15 19:44:54'),
(3, 1, 'message.autoresp', 'Message Confirmation', '<h3><strong>Dear %{recipient.name.first},</strong></h3> Your reply to support request <a href=\"%%7Brecipient.ticket_link%7D\">#%{ticket.number}</a> has been noted <br /> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature} </div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>You can view the support request progress <a href=\"%%7Brecipient.ticket_link%7D\">online here</a></em> </div>', NULL, '2023-12-15 19:44:54', '2023-12-15 19:44:54'),
(4, 1, 'ticket.notice', '%{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> Our customer care team has created a ticket, <a href=\"%%7Brecipient.ticket_link%7D\">#%{ticket.number}</a> on your behalf, with the following details and summary: <br /> <br /> Topic: <strong>%{ticket.topic.name}</strong> <br /> Subject: <strong>%{ticket.subject}</strong> <br /> <br /> %{message} <br /> <br /> %{response} <br /> <br /> If need be, a representative will follow-up with you as soon as possible. You can also <a href=\"%%7Brecipient.ticket_link%7D\">view this ticket\'s progress online</a>. <br /> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature}</div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small\"><em>If you wish to provide additional comments or information regarding the issue, please reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login to your account</span></a> for a complete archive of your support requests.</em></div>', NULL, '2023-12-15 19:44:54', '2023-12-15 19:44:54'),
(5, 1, 'ticket.overlimit', 'Open Tickets Limit Reached', '<h3><strong>Dear %{ticket.name.first},</strong></h3> You have reached the maximum number of open tickets allowed. To be able to open another ticket, one of your pending tickets must be closed. To update or add comments to an open ticket simply <a href=\"%%7Burl%7D/tickets.php?e=%%7Bticket.email%7D\">login to our helpdesk</a>. <br /> <br /> Thank you,<br /> Support Ticket System', NULL, '2023-12-15 19:44:54', '2023-12-15 19:44:54'),
(6, 1, 'ticket.reply', 'Re: %{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> %{response} <br /> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature} </div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>We hope this response has sufficiently answered your questions. If not, please do not send another email. Instead, reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\" style=\"color:rgb(84, 141, 212)\">login to your account</a> for a complete archive of all your support requests and responses.</em></div>', NULL, '2023-12-15 19:44:54', '2023-12-15 19:44:54'),
(7, 1, 'ticket.activity.notice', 'Re: %{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> <div><em>%{poster.name}</em> just logged a message to a ticket in which you participate. </div> <br /> %{message} <br /> <br /> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>You\'re getting this email because you are a collaborator on ticket <a href=\"%%7Brecipient.ticket_link%7D\" style=\"color:rgb(84, 141, 212)\">#%{ticket.number}</a>. To participate, simply reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\" style=\"color:rgb(84, 141, 212)\">click here</a> for a complete archive of the ticket thread.</em> </div>', NULL, '2023-12-15 19:44:54', '2023-12-15 19:44:54'),
(8, 1, 'ticket.alert', 'New Ticket Alert', '<h2>Hi %{recipient.name},</h2> New ticket #%{ticket.number} created <br /> <br /> <table><tbody><tr><td><strong>From</strong>: </td> <td>%{ticket.name} &lt;%{ticket.email}&gt; </td> </tr> <tr><td><strong>Department</strong>: </td> <td>%{ticket.dept.name} </td> </tr> </tbody> </table> <br /> %{message} <br /> <br /> <hr /> <div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\">login</a> to the support ticket system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <a href=\"https://osticket.com/\"><img width=\"126\" height=\"19\" style=\"width:126px\" alt=\"Powered By osTicket\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>', NULL, '2023-12-15 19:44:54', '2023-12-15 19:44:54'),
(9, 1, 'message.alert', 'New Message Alert', '<h3><strong>Hi %{recipient.name},</strong></h3> New message appended to ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> <br /> <br /> <table><tbody><tr><td><strong>From</strong>: </td> <td>%{poster.name} &lt;%{ticket.email}&gt; </td> </tr> <tr><td><strong>Department</strong>: </td> <td>%{ticket.dept.name} </td> </tr> </tbody> </table> <br /> %{message} <br /> <br /> <hr /> <div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support ticket system</div> <em style=\"color:rgb(127,127,127);font-size:small\">Your friendly Customer Support System</em><br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2023-12-15 19:44:54', '2023-12-15 19:44:54'),
(10, 1, 'note.alert', 'New Internal Activity Alert', '<h3><strong>Hi %{recipient.name},</strong></h3> An agent has logged activity on ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> <br /> <br /> <table><tbody><tr><td><strong>From</strong>: </td> <td>%{note.poster} </td> </tr> <tr><td><strong>Title</strong>: </td> <td>%{note.title} </td> </tr> </tbody> </table> <br /> %{note.message} <br /> <br /> <hr /> To view/respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\">login</a> to the support ticket system <br /> <br /> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2023-12-15 19:44:54', '2023-12-15 19:44:54'),
(11, 1, 'assigned.alert', 'Ticket Assigned to you', '<h3><strong>Hi %{assignee.name.first},</strong></h3> Ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> has been assigned to you by %{assigner.name.short} <br /> <br /> <table><tbody><tr><td><strong>From</strong>: </td> <td>%{ticket.name} &lt;%{ticket.email}&gt; </td> </tr> <tr><td><strong>Subject</strong>: </td> <td>%{ticket.subject} </td> </tr> </tbody> </table> <br /> %{comments} <br /> <br /> <hr /> <div>To view/respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support ticket system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2023-12-15 19:44:54', '2023-12-15 19:44:54'),
(12, 1, 'transfer.alert', 'Ticket #%{ticket.number} transfer - %{ticket.dept.name}', '<h3>Hi %{recipient.name},</h3> Ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> has been transferred to the %{ticket.dept.name} department by <strong>%{staff.name.short}</strong> <br /> <br /> <blockquote>%{comments} </blockquote> <hr /> <div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\">login</a> to the support ticket system. </div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <a href=\"https://osticket.com/\"><img width=\"126\" height=\"19\" alt=\"Powered By osTicket\" style=\"width:126px\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>', NULL, '2023-12-15 19:44:54', '2023-12-15 19:44:54'),
(13, 1, 'ticket.overdue', 'Stale Ticket Alert', '<h3><strong>Hi %{recipient.name}</strong>,</h3> A ticket, <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> is seriously overdue. <br /> <br /> We should all work hard to guarantee that all tickets are being addressed in a timely manner. <br /> <br /> Signed,<br /> %{ticket.dept.manager.name} <hr /> <div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support ticket system. You\'re receiving this notice because the ticket is assigned directly to you or to a team or department of which you\'re a member.</div> <em style=\"font-size:small\">Your friendly <span style=\"font-size:smaller\">(although with limited patience)</span> Customer Support System</em><br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" height=\"19\" alt=\"Powered by osTicket\" width=\"126\" style=\"width:126px\" />', NULL, '2023-12-15 19:44:54', '2023-12-15 19:44:54'),
(14, 1, 'task.alert', 'New Task Alert', '<h2>Hi %{recipient.name},</h2> New task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> created <br /> <br /> <table><tbody><tr><td><strong>Department</strong>: </td> <td>%{task.dept.name} </td> </tr> </tbody> </table> <br /> %{task.description} <br /> <br /> <hr /> <div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\">login</a> to the support system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <a href=\"https://osticket.com/\"><img width=\"126\" height=\"19\" style=\"width:126px\" alt=\"Powered By osTicket\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>', NULL, '2023-12-15 19:44:54', '2023-12-15 19:44:54'),
(15, 1, 'task.activity.notice', 'Re: %{task.title} [#%{task.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> <div><em>%{poster.name}</em> just logged a message to a task in which you participate. </div> <br /> %{message} <br /> <br /> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>You\'re getting this email because you are a collaborator on task #%{task.number}. To participate, simply reply to this email.</em> </div>', NULL, '2023-12-15 19:44:54', '2023-12-15 19:44:54'),
(16, 1, 'task.activity.alert', 'Task Activity [#%{task.number}] - %{activity.title}', '<h3><strong>Hi %{recipient.name},</strong></h3> Task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> updated: %{activity.description} <br /> <br /> %{message} <br /> <br /> <hr /> <div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support system</div> <em style=\"color:rgb(127,127,127);font-size:small\">Your friendly Customer Support System</em><br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2023-12-15 19:44:54', '2023-12-15 19:44:54'),
(17, 1, 'task.assignment.alert', 'Task Assigned to you', '<h3><strong>Hi %{assignee.name.first},</strong></h3> Task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> has been assigned to you by %{assigner.name.short} <br /> <br /> %{comments} <br /> <br /> <hr /> <div>To view/respond to the task, please <a href=\"%%7Btask.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2023-12-15 19:44:55', '2023-12-15 19:44:55'),
(18, 1, 'task.transfer.alert', 'Task #%{task.number} transfer - %{task.dept.name}', '<h3>Hi %{recipient.name},</h3> Task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> has been transferred to the %{task.dept.name} department by <strong>%{staff.name.short}</strong> <br /> <br /> <blockquote>%{comments} </blockquote> <hr /> <div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\">login</a> to the support system. </div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <a href=\"https://osticket.com/\"><img width=\"126\" height=\"19\" alt=\"Powered By osTicket\" style=\"width:126px\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>', NULL, '2023-12-15 19:44:55', '2023-12-15 19:44:55'),
(19, 1, 'task.overdue.alert', 'Stale Task Alert', '<h3><strong>Hi %{recipient.name}</strong>,</h3> A task, <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> is seriously overdue. <br /> <br /> We should all work hard to guarantee that all tasks are being addressed in a timely manner. <br /> <br /> Signed,<br /> %{task.dept.manager.name} <hr /> <div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support system. You\'re receiving this notice because the task is assigned directly to you or to a team or department of which you\'re a member.</div> <em style=\"font-size:small\">Your friendly <span style=\"font-size:smaller\">(although with limited patience)</span> Customer Support System</em><br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" height=\"19\" alt=\"Powered by osTicket\" width=\"126\" style=\"width:126px\" />', NULL, '2023-12-15 19:44:55', '2023-12-15 19:44:55');

-- --------------------------------------------------------

--
-- Table structure for table `ost_email_template_group`
--

CREATE TABLE `ost_email_template_group` (
  `tpl_id` int NOT NULL,
  `isactive` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL DEFAULT '',
  `lang` varchar(16) NOT NULL DEFAULT 'en_US',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_email_template_group`
--

INSERT INTO `ost_email_template_group` (`tpl_id`, `isactive`, `name`, `lang`, `notes`, `created`, `updated`) VALUES
(1, 1, 'osTicket Default Template (HTML)', 'en_US', 'Default osTicket templates', '2023-12-15 19:44:53', '2023-12-15 13:44:53');

-- --------------------------------------------------------

--
-- Table structure for table `ost_event`
--

CREATE TABLE `ost_event` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `description` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_event`
--

INSERT INTO `ost_event` (`id`, `name`, `description`) VALUES
(1, 'created', NULL),
(2, 'closed', NULL),
(3, 'reopened', NULL),
(4, 'assigned', NULL),
(5, 'released', NULL),
(6, 'transferred', NULL),
(7, 'referred', NULL),
(8, 'overdue', NULL),
(9, 'edited', NULL),
(10, 'viewed', NULL),
(11, 'error', NULL),
(12, 'collab', NULL),
(13, 'resent', NULL),
(14, 'deleted', NULL),
(15, 'merged', NULL),
(16, 'unlinked', NULL),
(17, 'linked', NULL),
(18, 'login', NULL),
(19, 'logout', NULL),
(20, 'message', NULL),
(21, 'note', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ost_faq`
--

CREATE TABLE `ost_faq` (
  `faq_id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED NOT NULL DEFAULT '0',
  `ispublished` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `keywords` tinytext,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_faq_category`
--

CREATE TABLE `ost_faq_category` (
  `category_id` int UNSIGNED NOT NULL,
  `category_pid` int UNSIGNED DEFAULT NULL,
  `ispublic` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(125) DEFAULT NULL,
  `description` text NOT NULL,
  `notes` tinytext NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_faq_topic`
--

CREATE TABLE `ost_faq_topic` (
  `faq_id` int UNSIGNED NOT NULL,
  `topic_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_file`
--

CREATE TABLE `ost_file` (
  `id` int NOT NULL,
  `ft` char(1) NOT NULL DEFAULT 'T',
  `bk` char(1) NOT NULL DEFAULT 'D',
  `type` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `size` bigint UNSIGNED NOT NULL DEFAULT '0',
  `key` varchar(86) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `signature` varchar(86) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `attrs` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_file`
--

INSERT INTO `ost_file` (`id`, `ft`, `bk`, `type`, `size`, `key`, `signature`, `name`, `attrs`, `created`) VALUES
(1, 'T', 'D', 'image/png', 9452, 'b56944cb4722cc5cda9d1e23a3ea7fbc', 'gjMyblHhAxCQvzLfPBW3EjMUY1AmQQmz', 'powered-by-osticket.png', NULL, '2023-12-15 19:44:36'),
(2, 'T', 'D', 'text/plain', 24, 'MUhguMWtx86n3ccfeGGNagoRoTDtol7o', 'MWtx86n3ccfeGGNafaacpitTxmJ4h3Ls', 'osTicket.txt', NULL, '2023-12-15 19:44:53'),
(3, 'L', 'D', 'image/jpeg', 5761, 'aSYjIIzgieDX7aSdTRBVN3OTHURBznEI', 'IzgieDX7aSdTRBVNGcU0CSMmX_UYI_F1', 'sbuk-logo.jpg', NULL, '2023-12-15 21:12:46');

-- --------------------------------------------------------

--
-- Table structure for table `ost_file_chunk`
--

CREATE TABLE `ost_file_chunk` (
  `file_id` int NOT NULL,
  `chunk_id` int NOT NULL,
  `filedata` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_file_chunk`
--

INSERT INTO `ost_file_chunk` (`file_id`, `chunk_id`, `filedata`) VALUES
(1, 0, 0x89504e470d0a1a0a0000000d49484452000000da0000002808060000009847e4c900000a43694343504943432070726f66696c65000078da9d53775893f7163edff7650f5642d8f0b1976c81002223ac08c81059a21092006184101240c585880a561415119c4855c482d50a489d88e2a028b867418a885a8b555c38ee1fdca7b57d7aefededfbd7fbbce79ce7fcce79cf0f8011122691e6a26a003952853c3ad81f8f4f48c4c9bd80021548e0042010e6cbc26705c50000f00379787e74b03ffc01af6f00020070d52e2412c7e1ff83ba50265700209100e02212e70b01905200c82e54c81400c81800b053b3640a009400006c797c422200aa0d00ecf4493e0500d8a993dc1700d8a21ca908008d0100992847240240bb00605581522c02c0c200a0ac40222e04c0ae018059b632470280bd0500768e58900f4060008099422ccc0020380200431e13cd03204c03a030d2bfe0a95f7085b8480100c0cb95cd974bd23314b895d01a77f2f0e0e221e2c26cb142611729106609e4229c979b231348e7034cce0c00001af9d1c1fe383f90e7e6e4e1e666e76ceff4c5a2fe6bf06f223e21f1dffebc8c020400104ecfefda5fe5e5d60370c701b075bf6ba95b00da560068dff95d33db09a05a0ad07af98b7938fc401e9ea150c83c1d1c0a0b0bed2562a1bd30e38b3eff33e16fe08b7ef6fc401efedb7af000719a4099adc0a383fd71616e76ae528ee7cb0442316ef7e723fec7857ffd8e29d1e234b15c2c158af15889b850224dc779b952914421c995e212e97f32f11f96fd0993770d00ac864fc04eb607b5cb6cc07eee01028b0e58d27600407ef32d8c1a0b91001067343279f7000093bff98f402b0100cd97a4e30000bce8185ca894174cc608000044a0812ab041070cc114acc00e9cc11dbcc01702610644400c24c03c104206e4801c0aa11896411954c03ad804b5b0031aa0119ae110b4c131380de7e0125c81eb70170660189ec218bc86090441c8081361213a8811628ed822ce0817998e04226148349280a420e988145122c5c872a402a9426a915d4823f22d7214398d5c40fa90dbc820328afc8abc47319481b25103d4027540b9a81f1a8ac6a073d174340f5d8096a26bd11ab41e3d80b6a2a7d14be87574007d8a8e6380d1310e668cd9615c8c87456089581a26c71663e55835568f35631d583776151bc09e61ef0824028b8013ec085e8410c26c82909047584c5843a825ec23b412ba085709838431c2272293a84fb4257a12f9c478623ab1905846ac26ee211e219e255e270e135f9348240ec992e44e0a21259032490b496b48db482da453a43ed210699c4c26eb906dc9dee408b280ac209791b7900f904f92fbc9c3e4b7143ac588e24c09a22452a494124a35653fe504a59f324299a0aa51cda99ed408aa883a9f5a496da076502f5387a91334759a25cd9b1643cba42da3d5d09a696769f7682fe974ba09dd831e4597d097d26be807e9e7e983f4770c0d860d83c7486228196b197b19a718b7192f994ca605d39799c85430d7321b9967980f986f55582af62a7c1591ca12953a9556957e95e7aa545573553fd579aa0b54ab550fab5e567da64655b350e3a909d416abd5a91d55bba936aece5277528f50cf515fa3be5ffd82fa630db2868546a08648a35463b7c6198d2116c63265f15842d6725603eb2c6b984d625bb2f9ec4c7605fb1b762f7b4c534373aa66ac6691669de671cd010ec6b1e0f039d99c4ace21ce0dce7b2d032d3f2db1d66aad66ad7ead37da7adabeda62ed72ed16edebdaef75709d409d2c9df53a6d3af77509ba36ba51ba85badb75cfea3ed363eb79e909f5caf50ee9ddd147f56df4a3f517eaefd6efd11f373034083690196c313863f0cc9063e86b9869b8d1f084e1a811cb68ba91c468a3d149a327b826ee8767e33578173e66ac6f1c62ac34de65dc6b3c61626932dba4c4a4c5e4be29cd946b9a66bad1b4d374ccccc82cdcacd8acc9ec8e39d59c6b9e61bed9bcdbfc8d85a5459cc54a8b368bc796da967ccb05964d96f7ac98563e567956f556d7ac49d65ceb2ceb6dd6576c501b579b0c9b3a9bcbb6a8ad9badc4769b6ddf14e2148f29d229f5536eda31ecfcec0aec9aec06ed39f661f625f66df6cf1dcc1c121dd63b743b7c727475cc766c70bceba4e134c3a9c4a9c3e957671b67a1739df33517a64b90cb1297769717536da78aa76e9f7acb95e51aeebad2b5d3f5a39bbb9bdcadd96dd4ddcc3dc57dabfb4d2e9b1bc95dc33def41f4f0f758e271cce39da79ba7c2f390e72f5e765e595efbbd1e4fb39c269ed6306dc8dbc45be0bdcb7b603a3e3d65facee9033ec63e029f7a9f87bea6be22df3dbe237ed67e997e07fc9efb3bfacbfd8ff8bfe179f216f14e056001c101e501bd811a81b3036b031f049904a50735058d05bb062f0c3e15420c090d591f72936fc017f21bf96333dc672c9ad115ca089d155a1bfa30cc264c1ed6118e86cf08df107e6fa6f94ce9ccb60888e0476c88b81f69199917f97d14292a32aa2eea51b453747174f72cd6ace459fb67bd8ef18fa98cb93bdb6ab6727667ac6a6c526c63ec9bb880b8aab8817887f845f1971274132409ed89e4c4d8c43d89e37302e76c9a339ce49a54967463aee5dca2b917e6e9cecb9e773c593559907c3885981297b23fe5832042502f184fe5a76e4d1d13f2849b854f45bea28da251b1b7b84a3c92e69d5695f638dd3b7d43fa68864f4675c633094f522b79911992b923f34d5644d6deaccfd971d92d39949c949ca3520d6996b42bd730b728b74f662b2b930de479e66dca1b9387caf7e423f973f3db156c854cd1a3b452ae500e164c2fa82b785b185b78b848bd485ad433df66feeaf9230b82167cbd90b050b8b0b3d8b87859f1e022bf45bb16238b5317772e315d52ba647869f0d27dcb68cbb296fd50e2585255f26a79dcf28e5283d2a5a5432b82573495a994c9cb6eaef45ab9631561956455ef6a97d55b567f2a17955fac70aca8aef8b046b8e6e2574e5fd57cf5796ddadade4ab7caedeb48eba4eb6eacf759bfaf4abd6a41d5d086f00dad1bf18de51b5f6d4ade74a17a6af58ecdb4cdcacd03356135ed5bccb6acdbf2a136a3f67a9d7f5dcb56fdadabb7bed926dad6bfdd777bf30e831d153bdeef94ecbcb52b78576bbd457df56ed2ee82dd8f1a621bbabfe67eddb847774fc59e8f7ba57b07f645efeb6a746f6cdcafbfbfb2096d52368d1e483a70e59b806fda9bed9a77b5705a2a0ec241e5c127dfa67c7be350e8a1cec3dcc3cddf997fb7f508eb48792bd23abf75ac2da36da03da1bdefe88ca39d1d5e1d47beb7ff7eef31e36375c7358f579ea09d283df1f9e48293e3a764a79e9d4e3f3dd499dc79f74cfc996b5d515dbd6743cf9e3f1774ee4cb75ff7c9f3dee78f5df0bc70f422f762db25b74bad3dae3d477e70fde148af5b6feb65f7cbed573cae74f44deb3bd1efd37ffa6ac0d573d7f8d72e5d9f79bdefc6ec1bb76e26dd1cb825baf5f876f6ed17770aee4cdc5d7a8f78affcbedafdea07fa0fea7fb4feb165c06de0f860c060cfc3590fef0e09879efe94ffd387e1d247cc47d52346238d8f9d1f1f1b0d1abdf264ce93e1a7b2a713cfca7e56ff79eb73abe7dffde2fb4bcf58fcd8f00bf98bcfbfae79a9f372efaba9af3ac723c71fbcce793df1a6fcadcedb7defb8efbadfc7bd1f9928fc40fe50f3d1fa63c7a7d04ff73ee77cfefc2ff784f3fb803925110000001974455874536f6674776172650041646f626520496d616765526561647971c9653c0000032869545874584d4c3a636f6d2e61646f62652e786d7000000000003c3f787061636b657420626567696e3d22efbbbf222069643d2257354d304d7043656869487a7265537a4e54637a6b633964223f3e203c783a786d706d65746120786d6c6e733a783d2261646f62653a6e733a6d6574612f2220783a786d70746b3d2241646f626520584d5020436f726520352e362d633031342037392e3135363739372c20323031342f30382f32302d30393a35333a30322020202020202020223e203c7264663a52444620786d6c6e733a7264663d22687474703a2f2f7777772e77332e6f72672f313939392f30322f32322d7264662d73796e7461782d6e7323223e203c7264663a4465736372697074696f6e207264663a61626f75743d222220786d6c6e733a786d703d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f2220786d6c6e733a786d704d4d3d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f6d6d2f2220786d6c6e733a73745265663d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f73547970652f5265736f75726365526566232220786d703a43726561746f72546f6f6c3d2241646f62652050686f746f73686f70204343203230313420284d6163696e746f7368292220786d704d4d3a496e7374616e636549443d22786d702e6969643a36453243393544454136373331314534424443444446393146414639344441352220786d704d4d3a446f63756d656e7449443d22786d702e6469643a3645324339354446413637333131453442444344444639314641463934444135223e203c786d704d4d3a4465726976656446726f6d2073745265663a696e7374616e636549443d22786d702e6969643a4346413734453446413637313131453442444344444639314641463934444135222073745265663a646f63756d656e7449443d22786d702e6469643a4346413734453530413637313131453442444344444639314641463934444135222f3e203c2f7264663a4465736372697074696f6e3e203c2f7264663a5244463e203c2f783a786d706d6574613e203c3f787061636b657420656e643d2272223f3e8bfef6ca0000170b4944415478daec5d099c53d5d53f2f7b32c9646680617118905d3637d0cfad282aa82d0af6f3b3b62ef52bd6d685ba206eb54a15c1adf6538b52b4d53a564454a42c0565d132a86c82a0ac82ec8b0233ccc24c9297f7dd9bfc6f73e64e92c90c5071ccf9fd0e249397f7eebbf7fccff99f73efbb31860f1f4e593936a4da74d2d8eeef53b17f2f51c4fd5d6b7e4ba19385ee177a9bd0ed8d3e832534dfa4d2351ebafaad3cb2d92cb219cd636c6d59f3ceca11920b849e27f4c742af68f4b7a342f34c5ab8de4d3f9b12a4b0005d7301991447d63ebed7e2125a283457a85d680d22d2be26463405995d8dfeb63f4a4b44241bfa463e5902642d7d518a5a59a065e5bb29ad849e2a7480d0d384b617ea05e024bb89080d093d287495d0e94267093d90c1b9edf85f82b4a2d19451006dc65617ed2bb3538f76618a449b57c76781f6fd908e42af14fabf42bb65f89dde42af12ba4ce848a10bd21c9b23741803f3bb42c709fd6d4657921015003b74c8205f8ed9ec4096cdd19abf7884de2e74210cbf5b13ce2123e05ca1f7e37cc9e45788921c3af703d80d47b3a049b3b739e989d21c2aca8d36cb81c802adf94a6ba15385fe41e87147c04e1e018dbc00399da49b4542ef4d13b97e2d343fed999d16d57ee3a0498b7dd426b779e56559ead8fce504a16f0aed7584cf7b2e72bbbd426b01b8d6691c763f8a97fa1f4c471bb71db4d194b51e6a17c8022d2bdf1d9151e695a30032253ee47c99caef285ecd1c9b92df0aea58e88fc672b3e654d2cf52c7e62d922af6ff96ae2de3d152a1cb8556b1bfcb4249cb3a47ca54cc23fec93569fe1a0f4522061946f31d946c443be65c5fe470befd736aca64f19193f5427f227487d00e427f29f432e477dfc4efcf8abbf76094e6adf4d0a4955e9ab6d14d6e41218de63cac59cb3e86bc9e11a592eda79019f60aab6b74f54de64a7725f9bb9c3c2eff0fddc2c342bf04555c47f142493f11e7a6935d00cc6fc6d0f4e55e07fdf4a502ba654690262ef791d76191c76135efb1cd9af7b123d2a36f3e14a4903d4c5eabd1fe5d468e9edadf4a854e04008347b9f9e385be56871afaa22171232119c50e96dbe9c036173d58eaa7399b5c541532c8efb2a87bab08990263d1e68db32cd08e297a61086bb36cb4fa4031f5cfdf127b9da104845ea3fd4d4694a1145f62d5e62837fd39a1a312ad11912b274aabd67b68f1976eea901fa1055b5cf468690eb5f34763343127271eb14debfb31b68eb3cf3e3b6be1c7904c9bbf8cdedcdd8bfab7d824dc7cc67ef02c8a97dd95940178df20b66c10dae22834572ed31a416ad58808c2729de2e37372c914579db5c94d0b05d00c579472dd227ab5689eab3eb211ed3b99a75994e7aa8a17452c8f30de8c5cbe5c31ef62ef1f12ba04afe522e12784be91c178cbfcea75d04c59ccc8a37839df29b412f95e5b009b50f45856e70c820e4e58e1a5cdbb9d542822598fb689758bdf57906581760c8add885255d843353541f2d84399d04759363f91bdff40e8abda316b8456537c82399dc849ee0758cae8a3c42a907244ca2280f64ca18384ce8e013d2a401834e9ab3d4eca775a146a19891539be2570c9f6ca2561edf17e8fd079420f6581969598f8edb5b4a2a20d95ecec4bc33b7f4854eb6fe82b8329be1e51c95f11c5b874a1d4eb1489196349ec559ec8b142229456daaac856673e4cca761457a653e2319b7cf258bbb6ee70d1b0c979b4eda09d5a78a37252ad1dc527b723a0b029fd0bc5579a48aa5b20d48df6ca08bab109dd2823f23d4207328afb43a1dbb240cb4a4c2c11481c24cbddb528f11b149f074e29329aa9b027170fbf9be498ae1ab5d42f2acff027725a9f4b44dcfb561e9d2828dfd567098c1db2c59b107b80c650935d6159c720b96adf8a3d42b39d0a22347e6e80566e7752f7b691588e46f155ff72517315ce904a64e4dc041a7abef437147f22e079a13765a963568e8a14b8aae9fdbddde8e4e00eea259442fe5460cb038553f24fd03b5d4e4e79b15819de7a37e2b61e731cb4d17df302f4e4877e6a2fa8dfac0d6eaa0e1bb4b7d246c37ad7d0c80b2a880ec46696db89e6b48c3529d7dc459ee8a1454b7cf4d66a0f15b73415c808f91c01340d492ef2c2969478b6cddbc42e8c6ac0361b88a8474a8e475ff786d39891055a7a31601c4e78e3508ae33c38a6065efec82418369376d40468555911f50aec8d47b6e4f36a72deac2f5eef448ea58ba461dd539aa3db9a496dc2b74c9c951b1afb5e20669d9d5acb0286413336ba636b0f0f08a0e57b2c1a39a052dcb14057b55125a0b05ae464f3b7d718e3576df6866f9e9627724b8a1dc74af68af65530c33759dea7447e26172aaf07d8f2d1ff9587317effe985263d50483a09efc76581d6b0c8817e01b98f7cd46434c59f3ae6d287e2eb0adbe3987b8ed4c5a30254c7b92b68b22cf38b88d6397777aacd7ae4fc5800afbf04fdd2e5062d874b80cc4e2f52dbf0cdcfcccc0ddd332d488581682b9f61150b70796d762bd2ca67c9a7a537b7f24523f3b63ae9ea92022ab9f28004db12ea5a3b78f906d7ce817715c92a89af4b71a83857e05180cc0580c8b63c04f07b589e269dd2a39478505452cf3b50c49120fc239c979b9ab225c2b727ed19c8482fbc648196a22641f179a90ef83f999517a0b2e54c6ac8870b36e1903d22b2391ca174391a5fa8bb32491e24dbf500e94bed2cda2d22d96801b2179ef9672eddfe76b0b038dfbcc9618b3da8d99e5d4d562a17442d7ab263303a7ff27a3779dfc9a347cfaf282f793dbf7cd2a75e5bb9d3bab66361e41671813ed1ba516a8bd0c729be624497afd96b79839f4a40e3fdd66398e5a44b96b7a1a0a36c657f16680d4b84d1c50329a8e341786e19fd761f8d46380d934ab69d4277772a25476c5ecd96cc8b2af944fb4c56dcfe86aa20972951d378c0e631d74e1054f1376fe69dd12edf7cce65a753a256ec3e5e84d1c8fce807422f911a8ed2bdc707cd715345def6c53e3b2ddeee143431fa74aff6a111a66944c5e7938d3855947d271fd11922f44f42cf107a9d9623f19ccdc5de77a2f8960b76383bb984ec1f49ba463ec83a18d4b91011b312e3b080e24f103444e5e5b3729782d606e18cc653dd6df22ea6f814462125a638e48a9b49ac827922faba9386a78be18465db2a1c48e04e45c366a3027435c5e74b1623c1ae4c929b0c42e2e7c54517c13311e3d936500895a0cbfd248a1156373203f6e33b1edce81e50221931fac393c8b9a0f9e0f2c40ca115dab91e83d4055c7913a8d520e42816aa72ff22aa57b23e139d9583aadd7a16fa53f17d1b8b14ea7c3f419fc8364ea3f88a0c79ce8b700e3948ab9200a2ad8a1ec436c2310c8b361fcaa750d41e075a7d69cd220fa78db2523706c512259206de4fdee8c48dfbedd18b1f6b4355216a2f403631e0b27a09ca27f3895b847ea5e577d7a3fa375600715fae2bf67dea986f5e651834221436b6898ebdc2a80ff47384fe1db6f421c5d75c72e2ca6b9e4a4e02ad54f29724409351f74eaabfae53c9f9a0a5e9e6cc241b795a285f16f53aeb7be9c0e4130757012c94a40db7012f8310b975b9041a73d60e7886e7d1b07168e80fd817e682e7abd02e9fde7d099e8a8b1cec6728be625b1ad673f04c37e3fc5246a1e42baf251fa128c1df47c33822f03412a47281ea29da3556c218168236498fd91946f50d3aef200658523e39b1da513b4729dab412efefa6f813c05e96d34cc8b052c6238bccd32e637f1b05e02fc2a0f5c0352f64d4497a6639b92ce79be6087d4f672b3e7b38be06b2be7871ef2aeaeec06bb9825edf5a6035a2ca72b975c0dc751efabacaa016bee81d22924990cd455b7507548b5cb50ad1718cc8df66e5ba2de90ccfb5e2cdba2f49342538b47b30c63722572b6ba01fab01bc54858c47615fe9641302433ab6f6a80632d9c6e1b8df7600dd59ecf3b5c82dbba3df7bc0b6fa30c79f4eec3656fdf1c2e0fb2131fd9a798817019a020040814c469979e8401f3af63a78e6103aac2f2b459fc3ae752e5e0710663d300809b25718c85622628510a64bd01935ac3347a0ed8468741e0cb823c02bc1f5193e3f0bf7e0c7bd3d82f698308e7d309ece1974a0c9bcd710b4750dfe5688b6ca39ac298c6674d1bc7e3bbc9e579f395874c874c68a23290a364578fd3972a2f3e138b8bc1feb5f4b80cc1fa5671704e80e919715e644fb8a9cec06ac9abf2b09c8b8bc0a1b90ece15aadf4fe759aef2d40df47f0dd4ccaf2a9a2dd4d1ac8c2601fd2f15e4ef10d825e461008a5c8ab09c7ddc8decf60202314b8ce624ce54644da7e9478d68e40379f84d31f053ac9dbfe216cf23119c06c1a979527fe394070298b6203e1010650624ee65550aef371ace2acf701040bf1fe7480e838189d92229627aa0d5c2621c2aa05b2b7e3264f4747d78262de0b6e1d66605d0bca3012e7e8064e3d1c6d3f9112cf6bf5c2ebdb1958ef46243f1714b5b1320614fc62500a15b106c1d89570b6309819eb7bf5124541196f68bf8c7caeea64f9591eebb7452cc7716a51659830d7ed5460d2cb4b7c3462662e15e444c9668bf5878cda6fb3e89e4ed444f87fc381aad2fd3d6c2c75d98131b95ca3a48d957614df558b8bbcee50b09a77c042ae475ffb293117a700bb034e9f6fa9b00481a196a51043d8e712c47fc6e726d281fbd8e79781cd3c0150717eff36aaaeb29d636d5a989ec0e6623ec609945c04a35586f104a302ff82272018f879f83e21dcb646bee447b42c0705cd47e408b2ca4d4f16c966200fca017551e7ec0bc0d5e0fd6e78aaa9888aaa48f019724c173cdc348a3f662fe517a07152a683ea124acabf078dc9a41225650522a389c8328e1d73211cd6a78c21a81caf27f37ecbeb700d234a65110fe5b92b523d759dcbfa6d03a35e4abe821155927ca8b2ca46ef6f709343bcf60bfa28685f6f16493399cc5d0e70754234fb2bae712ea2d6431897028db6495bd9494d9b6754116d288bfc0446f287469c672f22ea5896b7ae41fff05d99af003323b0a82949ce3507e3ad72d801acc063d3a87dcaaae347dafb8540a90340511bbe7c00bac2450128884e919ee57794d8cca5150cfe7544ce4b0096fe68d42ae459aa43a5112e8331dbe0557258343c9e79a2c5cc903bb2c8f95f42bf40874431707e166d78de56cbdeaf03e8bb6708b4355a65f22b78d0e3e048b602cc27c3500d44e9beac9feb806c77ad9ffa04f6500719cdcc64f978ec3e5d68f716fcad428bb09bd50f47bcbed447afadf052b7c2887cc8d260fd9ce98f51ec8113ea0276f011a2dbd3a0c00f42bf86432c45eeb688524ff8672a03b5f72f36f2fb39a070aa382103c4ad8ce613ec94afa07122425a0c3435781d4832c5a2072d473aa09949383325a9bed524f1827c998b1b615919db190015013c1edcb4a45abd19c857b39bd80f301bec26aad1e6cf61546ecde055b9d8c3a2d35a749a9d1213a6657008aa1ad8d4690e2345bf998c46a836ce06fde90c2adb07ed5c0be7f36f17bead26482709903dd06336b96d2210c4b636a85710e9c61cdc4a561451530f712aeab2a862a793a62cf3519ba0a99e64b6b17bce34d2f07b72b2b11c08ca7521c6b21fe8d71046a16ea3a62de8b592cc17963761aeed4cadb89183ea376940e37b509e4ce996ae252490c206281dd0f42771fbb063b6800214c31b77609e946040f90c8835180809b40b1065f6c0b0d4e31a97b2c8f239c01566d5a3a19a975625f508aeafa2939d4d2896c3abfa71ce61f0faea7307bedf17f75180e8a8775ecb0c9377d20a1c525a30c7b28b45cd4fe0746e60c587c5e897b86559063dde6d2e15f9f7922706325faafd434e60c6ae8a2821966bc7fb4dd0c48dfb1d34759d9bba251ebc3429b18f48a65b1cf8d02f11aa3b191b01f5fd107d5c8cfe389b152ae458fc8cd4063d4d77680d1a740ad1135c2722dc0ac684ec5a7e1b4d33b513812d39d938da523889a41f0e67865f4075574e7fc0e634bab2ea939acfb99b356235cbf3545e520c63530f10560268a762e03e62002318e48fd8353aa12cfb77cc6354a7a8506d619dd70ff9a2fabc27a620fe0f45096530c35815d48e42498b46785c791dbe95c055ecf522ad38a1728e1fe3f55bfc8445de723a217f0b051d358864494196c768ed275a345774b0b681b6af67ce3413e986b2f676e43cc751fd5d882df4ff5c140706e2d8412812351560116d0e2caf09e79a8cc2899256a81afa5864afd12aa6e750628ef53ca61742252bfb23632e562aa0e911ed14508e1994982c56d59979283a8c00b04623227c4675378699c1aa6c2b0028bf96b4efc580f462f3149fb282cc6078da975052fd1237d59d150f2a29f92e5e5528e85c8ece9c8af73b0186b6e884ab50d0990083790305971e1ac01b0299eac7f1e8fc001c886acb1bec3899a7fd1ac704d01f1ff393dedd7901d9648551e665a99fae1e0c5af309c6454fc0b7fddb68c206752988d0d0eeb5b468bb33b6210e9b5b5355c427a8e15f8c198871fc1ba2f5c7282efd94524f0eaf42d1621cf2ba579b18d1b668efafd48b470dc84e14abd6c0299eceeee90e7c56a61546fc68ffc126445deef4ea453413206b8f12797f366877e2f517a03ddfe0c43f44a9bd279bb3b99575fc622de1547310fb984795b29479ad7988ac07603897a20cdf1dc73c850a612b56c20d68f73209f31f11789aab31d7d1964d41bc817997296cde6b24b8fcb3ac1c1d4891c3799937fc1cfd740da2956acb48f4012f362dd34ac075263c7d22a251c4956e407bb36af04b1ab52e60112d4eb1420605da86e99ad3ab687fb54d2f5e95829d5cdf80111531765302c32f474a509421bd360f23a2bda339b611193a4362fdb10bf6f080e6181e44c48d52dd5fcc398df886430d8bfe53555d5345343bbcf218d0421faa6faf22a228f907f8f7507829278ce503ccb570cab20f03d409de9dd39c7b01885012ef340509fee5302c17403a15d14c958d7f815c6a13d55ff0f96718f930388230ee63068b2221dceb2c783737aef11a0a149df09d64fb227e8168e083e793e7ba19f9de7e50953949b8fd2c4653e7d43b6b6d4046323f0a25fb357a7c3afab83568d044eddb43d87447c254455493e57d2dfecb717a1ce77b0aa5fb6949eeb31051bf330cfe23e6cc6474fe2dc621d91c4457440cd223772365261cb09a1af1c0514e44fb7781950c80dd946aed71b2a2d47b70a4a318061e076b9b08a7a3162bdc8f7b180f675a0bc7ab72d0a56c0cabc122fc6c8e6d246cdb702449123f8031bb603cc9f8cb3a2493ea07ec4269e6629642939d635d9acedd806b38718db0768d43946492579315e87855de0f27b91f799ebfc0a118aca0f05192e90e2e07883d6f0419858133b581568598202596fe7c46f5d73d8a56ca072bad9e18248b45275e391b4ff5374bed01cf4cf51c83e8bdb25a1b850e19e4c8abb349ce3478f88761b0cfc24195e13ecec4679dd08fb7b3b3be00605f0b631c073a1ac1980d46b42844e49d7e184033d1b73329b1be533ab8df205f3f08f0b580935ca84d29e8b4ee1938d67e782f03c6efc1c64621d5506ee97f702f07d8bde502d8250c685b70dd8b5865732cdabec491a20a6965904cd311981fc9440ef7814a4b4b728fd675944198294ac0772202f664b4b1fef2a5785eb618cce257c8fb0a700fd310c9e624b9c60044f728a22d8b5d069d5d14a2d33a86686bb99de76984fc6433febf15aa8ff12bf0ee3bd8df556efe340a4bc9b650280350c768fdebd70a3b5e061ebbc6b2942c075d7c9e018458becbabb105547709569ec6de760004bc10750baabf8fe0be9e625328c114d5d9965a3f3d0c6718607892dad1a135c04d59391a92835c53816c33a8653a59096ae6426ea976a14a3597730306fb7ad27f9d53d0c62e27d4d2259b6a68cc9c80005a3d5ff01aa2f3a598f66801606f06655b9ae2bacb29f123f132a76907b0ec039d9f4dc937d7998e625618f7f515ab844e4074f253fd5f195d8aebfd08ff7766154875cd994865a6e37f0b6dd0e9ffdb486b06205ab544dbbdf8ee2728989d838ab91f4e541ebb15e77c5f3be722b4eb564a4c8dc99469bef1f2cb2ff742688ca0911bb3b838e222a9c62fe12177c2fb7f9aecc0ebca4635e5fc7654212b51c1ad2f4193464f0fd298d21cea10349b439f1a70306a43950a4acc2736b8a3519a7ed40b377644332fd84235a8aad540db5a2070c9e3cbfe5f800100b3e0af98735d4afd0000000049454e44ae426082),
(2, 0, 0x43616e6e6564204174746163686d656e747320526f636b21),
(3, 0, 0xffd8ffe000104a46494600010100000100010000ffe201d84943435f50524f46494c45000101000001c800000000043000006d6e74725247422058595a2007e00001000100000000000061637370000000000000000000000000000000000000000000000000000000010000f6d6000100000000d32d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000964657363000000f0000000247258595a00000114000000146758595a00000128000000146258595a0000013c00000014777470740000015000000014725452430000016400000028675452430000016400000028625452430000016400000028637072740000018c0000003c6d6c756300000000000000010000000c656e5553000000080000001c007300520047004258595a200000000000006fa2000038f50000039058595a2000000000000062990000b785000018da58595a2000000000000024a000000f840000b6cf58595a20000000000000f6d6000100000000d32d706172610000000000040000000266660000f2a700000d59000013d000000a5b00000000000000006d6c756300000000000000010000000c656e5553000000200000001c0047006f006f0067006c006500200049006e0063002e00200032003000310036ffdb004300030202020202030202020303030304060404040404080606050609080a0a090809090a0c0f0c0a0b0e0b09090d110d0e0f101011100a0c12131210130f101010ffdb00430103030304030408040408100b090b1010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010ffc0001108006200d003012200021101031101ffc4001d000101000203010101000000000000000000080607010205040903ffc4005510000102050204020406090c13000000000102030004050611072108123141135109226171141532425281161856627491a1b2b317233335394354757693c4d21927293437535765667282839294a2b1c2d4e1ffc4001b01000105010100000000000000000000000001020405060307ffc4003511000103020306030605050000000000000100020304110521311241516171811332d106142291a1b1153353c1e116343542f0ffda000c03010002110311003f00fd5084210212108408580de3596e93a9d624bbce7222a7f194a0df62bf090b48ff00a4c67d136718f5ba85b8ab12e1a4bde1ce53aa6f4cb0aedcc94a0e0fb0f43ec31baf4e2faa36a35a72375515e0a6e69003ad67d661d1f2db50ec41fc63062a29ab98eac9695c7e21623a102ff22a6cd4ce14f1ce34371f22b28842116ea126c2033e508f0eefbae8d63dbd397357e692c49c8b65c5927751f9a948eea27000f6c739246c4d2f79b0095ad73c86b45c958fd32b52f3dac95ca532bcaa9b42920f00764adc79d501efc63f1c6799112f709f75d42f8d44d40bb2a630fd4fe0ef720e8da39961081ee4803ea8a871b6220615522b20f1c6849b74be4a556c069a4f08ea00fb242108b35112108408484210212108408484210212108408484210212108408484210214bbc7263e28b4f1fc2e67f31313fe956aedd5a4b59554684ea5f9398204ed3de27c29803a1fbd50eca1f5e44501c728028f6963f85cd7e62224e95949b9f9a6a4a4255e9999795cadb2cb656b59f2091b98f26f68659a0c61cf8090e16b5ba2dd60f147361c1928b837d7aabdec2e2734b2f669b6a62b29a14fa80e795a8a837eb770973e4287d60fb23627d985a85bf19372d28b6467984e378c7bf9a21fb57851d5eb9d94cc4e52a5288c2f706a2f72b87fdda4150faf11978e07af00d64de945f13e8f80ef2fe3ff00e46968b17c65f182fa6dae7a5fb154d5387e1cd7d9b35b96bf50b7bdefc48694d92c2c3b7133569c00f24a53941f593db2a1eaa47b4988f357b5bae9d5ea921550c48d26557cd294e6d64a127e9acfcf5e3bf41da323b9b849d5cb71854cc848c8569a4f54c83f873dfc8b009fab26350d429d50a44ebb4dab484c494db270e3130d96d68f783bc6771dc5314987873b0c6c3bac73ea55c615454111db89db6ee3c3b6e54b7037fb7176fe0f2bf9cb8aea245e06ff006eaecfc1e57f39715d46cfd95ff171f7fbacee3bfdebfb7d92108468d542421081090842042421081090842042421081090842042c2ab8ad6069c9872dc45a2fb414a2c3537f096d651d82949c8cfd588d2f7df111af3a70b48bbb4a6932ac2d5ca89a6df75d9759f20e24e01f61c18a700c748f96a54c90acc93d4daa49b3372b3082dbacbc80b42d27b10763157594334cd3eef339aeec47caca5d3d44513878ac0e1dc1fa2903eddfbefee2e87fcf3d1c7dbbd7dfdc5d0bf9e7a319e23742bf52eaa375fb75b7176e545ce4424e5464de3bf844f749df949f223b46994a1c71496da4296b59094a5232544ec001e798f37acc5719a19cd3cb21da1d33e16c96c69b0fc36aa212b182ddfd56f2abddfa83c5956e8f684b5bd4fa77c5ae3932ecd32a714db0dac04a96e157bb6037262a4d2dd18b2f4aa9c19a24925fa82d204cd4661014fbc71be0fcc4fde8dbdf1f36836964a696d8f2d4f71a49ab4f25335527b1eb29d50d9bcfd1403ca07bcf78d938dba46e707c2b600ababf8a576a4eee4166310ae0f3eef4ff000c6370dfcd730842346aa92309d48d27b3754696646e4a6a14fa527e0f3ad2426618576295f71f7a720c66d1c7be38cd0c750c31cad041dc53e391f1383d86c429e7872d28b8b49efabb68b5a4f8f2afcb4b39233c84e1b986f9d79dbb286d94f6f718a1a031d7ce3911c6868e3a0844317945eddcdd74a9a87553fc47eb924210898b824210810908420424210810908420424210810908420424210810b16d4cb424efbb12b36c4db2162765561adb743a91ccda87910a02216e1eed83736b1dbf4c9a6b2dc9cc2e7661247f88055823fd7091f5c7e8828a4254547000cc44fc313f2ae711354719e5287d15353046c394bd918faa31ded052c7257d2b9da9758f404157f854ef6524ed1b85fbe8ada1d210846c74540bc8ba6e6a2d996ed46ebb927db92a652e5d7353730e1f55b6d2324fb4f603a92408fcf1d50f49b5fd52aa3f29a496d536934a4af925e6ea6c9989a787d22d8504233d93eb11dcc513e91345557c32d57e2d0e1653529054f7267fbdfc4ef8edcfe1fb2228e08b51b4774cf5526ab7abccb2d36ec9066935098952fb52531ce0a94a00129253b05e0e37e998d97b3f8653ba864af963f11cd360df97aaa7afa9904cd818ed90752bd6a47a44f89ca1cda55589da1d4db2ae62c4ed2032543c829b2923f2c5a9c2d71836bf112d3f419da78a15db20cf8efd38bbced4cb59c1765d47720123992774e4751bc64d79d2745389ed39aa5b347af5b35d4cfca3adc94dcabcd3cec9cc14fa8ea797d7414ab9491b64020c4efa05c036a868deaddb9a8d31a8b409996a43cb336c4b32fa5c7d95b6a42d03231be7bf9436aa5c26b695fb517832b7419e7cb4fba58db530cadb3b6d875e4be8e3a789bd63d13d4ca0db9a73724b53e427689f0d7db7645a7ca9df1d68cf32c123648da26f1c7ef14e46d7bc91f751583ff8c67be9411fdba2d63fe8dff497237afa3a6ad6c4970f259ac54a96c3ff001f4f282665e6d2be5c3783851ce22d201474182c556fa76c8e396633df9dec54673a59aadd135e5a14ad23e90ae2824a6039317451e713dd999a3b4127fe1e53f962c3e1178d046bfd4266c8bbe892d48baa525ccdb26516a32d3eca480b280add0b4e412924820e41d888f9f8eaa9e884c6845713569ab6e62e17928f88bc05b2b9c334169ddb28f5b94279b9bb63af68953d1d16ad72b5c44cb5c52128eaa9b40a6cd2e7e6424f86d975050da09e9cca272075c2498e52c187e29854b562111399a751f2bdf44f6be7a7a96c45fb40aaef54f5b3516dae3234ef48e8f58619b5ee0910f5425552a852dc5febfb8708e64fec69e87b453c3a6d113eb87ee8a690ff0016ff00ecc5b1df78ca62513238a02c005d973ccdceaace9dee739e09d0fec10ec3a44c1a45ad9a8975717da9ba515dabb2fdb56eca29da74aa655085b4a0b6864b80732b65aba9ef14ff00788a387efdd05d68fc017fa59784c3a263e29cbc5c86dc723719a2a1ce6b9801d4fec5669c1eeb7ea46ad5e5aa749be6b0c4f4adb35612b4c43728864b4df8afa704a47adb213b9f28a889ca76888fd1e7fe1135c7f8f93fa7998f77883e28eebbaeeb570f1c2eb4aac5dd38a54bd4ab52ea059a627a3810e7c90a4fce70ec8e832ae936bf0d33e20e869da0340049d0016172782e505406401cf37373d4e6bdee24f8b59eb3ebcd68be84d345cda97525863c365b0f334d27e98e8a700df94faa91babc8ee4d1aa1eaad12ce63f563bc98afdcb3587663e0b28db12f29b7ec2df200578eeb3d4f4c08c2b869e16ed4e1fe8ee4ebee8adde7544f355ab6f02a5ad677536d156e96f2773d547757603798cc40ac969d8d14f4c2e06ae23371fd8700bbc4d7b8f8921cf86e1fcae610845729090842042e330c63a47318e5e97eda9a7d495d62eaab33252e907912a565c74fd14206ea3ec11ce49590b4bde6c06f29cd639ee0d68b95e2eb65fb29a79a7557aebae0132b64cac9379c17261c052903ddba8fb04435a277522ccd53b76bf32f786c226c4bccac9dbc27416d44fbb9b3f547dfad7ac955d5fb8c4e38dae528f22548a7c99564a41eae2fb15abf20d846b9232307a4794e398e7bdd7b2487cb19cb99bdc95bac330bf0291cc9757ebcb25faae082363907a60c768d25c316afcbea0da2d5bd549a4fc7f42692cbe851f59f646c87879ed80af223db1bb7bc7a7d155475b03678cdc11ff000589a881f4d2ba27ea179770d1a897251672ddb8a4a5e729d526172d352d300143cd28614923dc7ea883f547d18ce3f373554d19be659b975a8adaa4d602886bef11308c923cb9939f33de366fa4734fae8ba34969977daaa9f5bb69cfae6275a945ac2cca3a8e55ac849dc208413e4326262e0c38bba5e854cd62dcd434d4676dfadbadcda27592a987a4df4a794e52a39536a4e3a6e08e8731bac1696be2a3756e1d25dd7cd96bdedfc72baa3ab96174a22a86e5b8ad777ef0a9c4468e34edc359b1ea0d49cb6eba9d1a604c21a48f9ca2d1e7427da400236af08bc695fd675e746b0351ebf355eb56af30dc836fceacbb334e75c504b6b4ba7d6537cc4052559c03918c60d4973fa42f869a5d11f9ca4d7aa15f9a2d2bc3a7cbd31f6d4b56364294ea528482762727dc63f3ab46eceadeafeba50e896e52c36e546b69a8bcdb40f87252a97bc571448e89424607b703bc68a0965c5a8a6fc5a10c0d193ad6dc74be7971501ed652cccf767defbaf75bff00d283b6b4daff00c9afe92e46bcd0be09efed7fb23ecfadbba2dfa7c989d7a44b33c1ef179dbe5c9f512460f30c6f1b0bd281b6b4dadfc9afe92e464dc17f167a2fa29a366ccbf6b53d2b543569a9cf0d8a7baf27c2702394f324633ea9da39c53564180c0ea1692ee42f95cee439b1495af129b0eb6e0b5b5fbe8e8d6eb12dc9bb9a4a7edeafb722d2de9895a7b8e2263c240ca8a12e2405e0027941cf9031e97039c5455f4e6eda3e92dc4cc8b96a57a7132cc3e896436fc9cd3a7085a9c4805c4294424f3e48c8c1db11446a27a46f43656d4a93765a6b15cabbf2ee35292eb9154bb3e2292402e2d78c2467270093d2202d05b3abba85acf685b7429653d34f55e5e6de5253eab2c34e071d755e494a527f2087d27bd623874ecc5d9b200b8245b71cfb224f0a9e761a537275ceeae2d70207a44f48771fb5a0673f84c5b3d6228e3b6915cd3ed4fd31e262994f76729d6ace3727554b29ca9b40779d04fb1495389c9db3ca3bc56d635f96a6a3db9277659b5b96a9d3675b4b8dbac2c2b97233cab1d50a1d0a4ee0c623116992969e6666d0dd93c882722ae298ecc8f69d6f7ec42c84e0444fc3e8fee82eb47f17aff4ac45677f6a0da3a676d4e5db7a5725a994d92429c5b8f2c053840c84213d56b3d0246e624fe03a8f5cbff50b53789badd39d9397bba757294a4ad380b6bc5e7594e7a84f2b48cf985794187b5d1d2544cfc9a5a1a0f1248361d8668a83b52b1a3506fdaca70d297b5c6e5d43d4cd1ed13419272f0aebe6b5590549f8be49b98792acb83e40578846deb1f929ea4c6d1d53e19af1e0dd16e6bce87d667aaff63cda5ab99a98e8fa547f5c75494fef0bcf2a93b94612acf52335f47963f545d711fe7e4fe9e662d69d9295a84abd233d2cd4c4bccb6a69e69d48521c42860a540ec411b111718a630fa4acf09806c586d0b79ae05efdb451a9a95b245b649be76e59ee585e8beb05a7ae160c85fb69cc1f0a653c9352ab50f164e6001cecb807707a1ee0823ac679bc7e7add347b9bd1f9ad88bded7979b9fd23bc660353d248055f045139f0fd8e3792a6cfce4e5077117a5b572d16f0b7e9f745b952667a9752611312934cab2875b50c823fec475041114188d0b602d9a03789d9b4f0e2d3cc29b04a5f763f270d7d7baf5e108456a9290842042c3ebb67dd7582fa25b52eab4d61d51e544a49cb053693d1216a413b79f58d5d5ae0fedeb8e75553b83512eaa94dababd34eb6e2b1e4329d87b04503ef84409f0ca6aafce6ed7527d5498ab2683f2cdba01e8a70fb48ac4fbacaefe267fab0fb48ac4fbadaefe367fab147c221ff004ee19fa43ebeaa4fe2d5bfa87e8b405b7c23dbf68d7252e2b76fcb864aa124be769d4167a774a872e1493d083b18df8da54100295cca0064e3193e71de113e96860a2696c0db03d5439ea65a93b529b95fc9d61b98696c3cda5c6d69295214321408dc107a831316a47a3cb416fda9bf5aa43353b4e6e655cee2690ea44b151eaa0cad2529cf92703d915143116b4b595144edb81e5a792892c31cc365e2e144d21e8b6d3462603951d4dba26d90afd890d4bb44a7c8a8249cfb7f24523a3dc3f696e85d31ea7e9edba995766801353efafc69b99c740b70ef81f44613ec8d907a6f1c6fef891558bd6d6b762a252e1c377d1323a48613763402a76e233836b5b88ebba9b77576f4ad51dea6d3fe2e4b324d32a42d3e2297cc4ad24e72a236db68d57fd8b1d3bff2b174ff00cbcaff00522de8e36023a53e398852c62186521a34197a26494504ae2f7b6e4a89e57d16ba64d3e95ce6a6dd530d03eb361b964737fb41191144e8cf0e5a51a1124f3160dbc1b9c99484cd546697e34e3e3e8a9c3d13f7a9007b2367f6f38e40c473aac5ebab19e1cf292de1bbe89f1524311da636c57c159a2526e1a5cd50ebb4e969f909d694ccccb4cb616dbad9ea9524ec444c555f47ae9acbd5662ada6b7fded6219a515392f47a91f0baf4015be0791262acc6f986d11a9eb27a5b885c403a8ddf2d13e486397cc2ea54a4fa3db4d1dabcbd63526fbbcefc54aa829b62b1512593ec213be3d808cc53947a352adfa5cb51a894e9791a7c9b49665e5a5db0db4d20744a5236023ef842d4d65455d84cf26da701db44470c71794596a1d11e1c6d9d0caeddd5da0572a95076f09d13d3489cf0f959505b8bc2394038cb87ae7a08dbdef876de11ca69a4a8778921bbb8f4c93d8c6c6365a2c16377fd876c6a65a152b22efa72276975464b2f367e524fcd5a0fcd5a4e0823a1118568068149f0f9409cb5a897b572b5497de1312f2b53536a126b3f2fc22848202b6253d3233dcc6d9c4215b51236230877c24dc8dd7e290c6d2e0f2330908423927a4210810baaba1827e48308427fb04e1a2e46c36ed1d13bf31308429d4f44d1bd773dbdf1c35ba959df04e210841a764223740cf781d9400e908429d103ccbb0e9f5475f9a0c210810755d88014903bc75fdf08ed08407cc10355cab607101f27ea84210681285c79415d8c210f4d668117b02476ce209f94a1084306810edc9dd423857457b338842178243e4eeb9f2812707ea8421dc12f05c8ed03b2b02108476a978aeb1d93d55ec842112ef5ffd9);

-- --------------------------------------------------------

--
-- Table structure for table `ost_filter`
--

CREATE TABLE `ost_filter` (
  `id` int UNSIGNED NOT NULL,
  `execorder` int UNSIGNED NOT NULL DEFAULT '99',
  `isactive` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `flags` int UNSIGNED DEFAULT '0',
  `status` int UNSIGNED NOT NULL DEFAULT '0',
  `match_all_rules` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `stop_onmatch` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `target` enum('Any','Web','Email','API') NOT NULL DEFAULT 'Any',
  `email_id` int UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_filter`
--

INSERT INTO `ost_filter` (`id`, `execorder`, `isactive`, `flags`, `status`, `match_all_rules`, `stop_onmatch`, `target`, `email_id`, `name`, `notes`, `created`, `updated`) VALUES
(1, 99, 1, 0, 0, 0, 0, 'Email', 0, 'SYSTEM BAN LIST', 'Internal list for email banning. Do not remove', '2023-12-15 19:44:33', '2023-12-15 19:44:33');

-- --------------------------------------------------------

--
-- Table structure for table `ost_filter_action`
--

CREATE TABLE `ost_filter_action` (
  `id` int UNSIGNED NOT NULL,
  `filter_id` int UNSIGNED NOT NULL,
  `sort` int UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(24) NOT NULL,
  `configuration` text,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_filter_action`
--

INSERT INTO `ost_filter_action` (`id`, `filter_id`, `sort`, `type`, `configuration`, `updated`) VALUES
(1, 1, 1, 'reject', '[]', '2023-12-15 19:44:34');

-- --------------------------------------------------------

--
-- Table structure for table `ost_filter_rule`
--

CREATE TABLE `ost_filter_rule` (
  `id` int UNSIGNED NOT NULL,
  `filter_id` int UNSIGNED NOT NULL DEFAULT '0',
  `what` varchar(32) NOT NULL,
  `how` enum('equal','not_equal','contains','dn_contain','starts','ends','match','not_match') NOT NULL,
  `val` varchar(255) NOT NULL,
  `isactive` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `notes` tinytext NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_filter_rule`
--

INSERT INTO `ost_filter_rule` (`id`, `filter_id`, `what`, `how`, `val`, `isactive`, `notes`, `created`, `updated`) VALUES
(1, 1, 'email', 'equal', 'test@example.com', 1, '', '0000-00-00 00:00:00', '2023-12-15 19:44:34');

-- --------------------------------------------------------

--
-- Table structure for table `ost_form`
--

CREATE TABLE `ost_form` (
  `id` int UNSIGNED NOT NULL,
  `pid` int UNSIGNED DEFAULT NULL,
  `type` varchar(8) NOT NULL DEFAULT 'G',
  `flags` int UNSIGNED NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL,
  `instructions` varchar(512) DEFAULT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_form`
--

INSERT INTO `ost_form` (`id`, `pid`, `type`, `flags`, `title`, `instructions`, `name`, `notes`, `created`, `updated`) VALUES
(1, NULL, 'U', 1, 'Contact Information', NULL, '', NULL, '2023-12-15 19:44:20', '2023-12-15 19:44:20'),
(2, NULL, 'T', 1, 'Ticket Details', 'Please Describe Your Issue', '', 'This form will be attached to every ticket, regardless of its source.\nYou can add any fields to this form and they will be available to all\ntickets, and will be searchable with advanced search and filterable.', '2023-12-15 19:44:24', '2023-12-15 19:44:24'),
(3, NULL, 'C', 1, 'Company Information', 'Details available in email templates', '', NULL, '2023-12-15 19:44:26', '2023-12-15 19:44:26'),
(4, NULL, 'O', 1, 'Organization Information', 'Details on user organization', '', NULL, '2023-12-15 19:44:26', '2023-12-15 19:44:26'),
(5, NULL, 'A', 1, 'Task Details', 'Please Describe The Issue', '', 'This form is used to create a task.', '2023-12-15 19:44:30', '2023-12-15 19:44:30'),
(6, NULL, 'L1', 0, 'Ticket Status Properties', 'Properties that can be set on a ticket status.', '', NULL, '2023-12-15 19:44:32', '2023-12-15 19:44:32'),
(7, NULL, 'I', 1, 'Inventory', 'Dynamic Asset Form: Add form fields to this form to add custom asset data. This form is used for data entry/access and is used by the CSV importer. If the CSV you are using to import data does not contain headers, the columns of the CSV must match the ordering of this form.', '', NULL, '2023-12-15 21:01:26', '2023-12-15 21:01:26');

-- --------------------------------------------------------

--
-- Table structure for table `ost_form_entry`
--

CREATE TABLE `ost_form_entry` (
  `id` int UNSIGNED NOT NULL,
  `form_id` int UNSIGNED NOT NULL,
  `object_id` int UNSIGNED DEFAULT NULL,
  `object_type` char(1) NOT NULL DEFAULT 'T',
  `sort` int UNSIGNED NOT NULL DEFAULT '1',
  `extra` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_form_entry`
--

INSERT INTO `ost_form_entry` (`id`, `form_id`, `object_id`, `object_type`, `sort`, `extra`, `created`, `updated`) VALUES
(1, 4, 1, 'O', 1, NULL, '2023-12-15 19:44:35', '2023-12-15 19:44:35'),
(2, 3, NULL, 'C', 1, NULL, '2023-12-15 19:45:05', '2023-12-15 19:45:05'),
(3, 1, 1, 'U', 1, NULL, '2023-12-15 19:45:05', '2023-12-15 19:45:05'),
(4, 2, 1, 'T', 0, '{\"disable\":[]}', '2023-12-15 19:45:06', '2023-12-15 19:45:06');

-- --------------------------------------------------------

--
-- Table structure for table `ost_form_entry_values`
--

CREATE TABLE `ost_form_entry_values` (
  `entry_id` int UNSIGNED NOT NULL,
  `field_id` int UNSIGNED NOT NULL,
  `value` text,
  `value_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_form_entry_values`
--

INSERT INTO `ost_form_entry_values` (`entry_id`, `field_id`, `value`, `value_id`) VALUES
(2, 23, 'SBUK', NULL),
(2, 24, NULL, NULL),
(2, 25, NULL, NULL),
(2, 26, NULL, NULL),
(4, 20, 'osTicket Installed!', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ost_form_field`
--

CREATE TABLE `ost_form_field` (
  `id` int UNSIGNED NOT NULL,
  `form_id` int UNSIGNED NOT NULL,
  `flags` int UNSIGNED DEFAULT '1',
  `type` varchar(255) NOT NULL DEFAULT 'text',
  `label` varchar(255) NOT NULL,
  `name` varchar(64) NOT NULL,
  `configuration` text,
  `sort` int UNSIGNED NOT NULL,
  `hint` varchar(512) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_form_field`
--

INSERT INTO `ost_form_field` (`id`, `form_id`, `flags`, `type`, `label`, `name`, `configuration`, `sort`, `hint`, `created`, `updated`) VALUES
(1, 1, 489395, 'text', 'Email Address', 'email', '{\"size\":40,\"length\":64,\"validator\":\"email\"}', 1, NULL, '2023-12-15 19:44:20', '2023-12-15 19:44:20'),
(2, 1, 489395, 'text', 'Full Name', 'name', '{\"size\":40,\"length\":64}', 2, NULL, '2023-12-15 19:44:21', '2023-12-15 19:44:21'),
(3, 1, 13057, 'phone', 'Phone Number', 'phone', NULL, 3, NULL, '2023-12-15 19:44:22', '2023-12-15 19:44:22'),
(4, 1, 12289, 'memo', 'Internal Notes', 'notes', '{\"rows\":4,\"cols\":40}', 4, NULL, '2023-12-15 19:44:23', '2023-12-15 19:44:23'),
(20, 2, 489265, 'text', 'Issue Summary', 'subject', '{\"size\":40,\"length\":50}', 1, NULL, '2023-12-15 19:44:24', '2023-12-15 19:44:24'),
(21, 2, 480547, 'thread', 'Issue Details', 'message', NULL, 2, 'Details on the reason(s) for opening the ticket.', '2023-12-15 19:44:24', '2023-12-15 19:44:24'),
(22, 2, 274609, 'priority', 'Priority Level', 'priority', NULL, 3, NULL, '2023-12-15 19:44:25', '2023-12-15 19:44:25'),
(23, 3, 291249, 'text', 'Company Name', 'name', '{\"size\":40,\"length\":64}', 1, NULL, '2023-12-15 19:44:26', '2023-12-15 19:44:26'),
(24, 3, 274705, 'text', 'Website', 'website', '{\"size\":40,\"length\":64}', 2, NULL, '2023-12-15 19:44:26', '2023-12-15 19:44:26'),
(25, 3, 274705, 'phone', 'Phone Number', 'phone', '{\"ext\":false}', 3, NULL, '2023-12-15 19:44:26', '2023-12-15 19:44:26'),
(26, 3, 12545, 'memo', 'Address', 'address', '{\"rows\":2,\"cols\":40,\"html\":false,\"length\":100}', 4, NULL, '2023-12-15 19:44:26', '2023-12-15 19:44:26'),
(27, 4, 489395, 'text', 'Name', 'name', '{\"size\":40,\"length\":64}', 1, NULL, '2023-12-15 19:44:26', '2023-12-15 19:44:26'),
(28, 4, 13057, 'memo', 'Address', 'address', '{\"rows\":2,\"cols\":40,\"length\":100,\"html\":false}', 2, NULL, '2023-12-15 19:44:27', '2023-12-15 19:44:27'),
(29, 4, 13057, 'phone', 'Phone', 'phone', NULL, 3, NULL, '2023-12-15 19:44:27', '2023-12-15 19:44:27'),
(30, 4, 13057, 'text', 'Website', 'website', '{\"size\":40,\"length\":0}', 4, NULL, '2023-12-15 19:44:28', '2023-12-15 19:44:28'),
(31, 4, 12289, 'memo', 'Internal Notes', 'notes', '{\"rows\":4,\"cols\":40}', 5, NULL, '2023-12-15 19:44:29', '2023-12-15 19:44:29'),
(32, 5, 487601, 'text', 'Title', 'title', '{\"size\":40,\"length\":50}', 1, NULL, '2023-12-15 19:44:30', '2023-12-15 19:44:30'),
(33, 5, 413939, 'thread', 'Description', 'description', NULL, 2, 'Details on the reason(s) for creating the task.', '2023-12-15 19:44:31', '2023-12-15 19:44:31'),
(34, 6, 487665, 'state', 'State', 'state', '{\"prompt\":\"State of a ticket\"}', 1, NULL, '2023-12-15 19:44:32', '2023-12-15 19:44:32'),
(35, 6, 471073, 'memo', 'Description', 'description', '{\"rows\":\"2\",\"cols\":\"40\",\"html\":\"\",\"length\":\"100\"}', 3, NULL, '2023-12-15 19:44:32', '2023-12-15 19:44:32'),
(36, 7, 28673, 'text', 'Hostname', 'host_name', NULL, 1, NULL, '2023-12-15 21:01:27', '2023-12-15 21:01:27'),
(37, 7, 20481, 'text', 'Manufacturer', 'manufacturer', NULL, 2, NULL, '2023-12-15 21:01:27', '2023-12-15 21:01:27'),
(38, 7, 20481, 'text', 'Model', 'model', NULL, 3, NULL, '2023-12-15 21:01:27', '2023-12-15 21:01:27'),
(39, 7, 20481, 'text', 'Serial', 'serial_number', NULL, 4, NULL, '2023-12-15 21:01:27', '2023-12-15 21:01:27'),
(40, 7, 12289, 'text', 'Location', 'location', NULL, 5, NULL, '2023-12-15 21:01:27', '2023-12-15 21:01:27'),
(41, 7, 0, 'text', 'Assignee', 'assignee', NULL, 6, NULL, '2023-12-15 21:01:27', '2023-12-15 21:01:27');

-- --------------------------------------------------------

--
-- Table structure for table `ost_group`
--

CREATE TABLE `ost_group` (
  `id` int UNSIGNED NOT NULL,
  `role_id` int UNSIGNED NOT NULL,
  `flags` int UNSIGNED NOT NULL DEFAULT '1',
  `name` varchar(120) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_help_topic`
--

CREATE TABLE `ost_help_topic` (
  `topic_id` int UNSIGNED NOT NULL,
  `topic_pid` int UNSIGNED NOT NULL DEFAULT '0',
  `ispublic` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `noautoresp` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `flags` int UNSIGNED DEFAULT '0',
  `status_id` int UNSIGNED NOT NULL DEFAULT '0',
  `priority_id` int UNSIGNED NOT NULL DEFAULT '0',
  `dept_id` int UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int UNSIGNED NOT NULL DEFAULT '0',
  `team_id` int UNSIGNED NOT NULL DEFAULT '0',
  `sla_id` int UNSIGNED NOT NULL DEFAULT '0',
  `page_id` int UNSIGNED NOT NULL DEFAULT '0',
  `sequence_id` int UNSIGNED NOT NULL DEFAULT '0',
  `sort` int UNSIGNED NOT NULL DEFAULT '0',
  `topic` varchar(128) NOT NULL DEFAULT '',
  `number_format` varchar(32) DEFAULT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_help_topic`
--

INSERT INTO `ost_help_topic` (`topic_id`, `topic_pid`, `ispublic`, `noautoresp`, `flags`, `status_id`, `priority_id`, `dept_id`, `staff_id`, `team_id`, `sla_id`, `page_id`, `sequence_id`, `sort`, `topic`, `number_format`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 0, 2, 0, 2, 0, 0, 0, 0, 0, 0, 1, 'General Inquiry', NULL, 'Questions about products or services', '2023-12-15 19:44:32', '2023-12-15 19:44:32'),
(2, 0, 1, 0, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Feedback', NULL, 'Tickets that primarily concern the sales and billing departments', '2023-12-15 19:44:33', '2023-12-15 19:44:33'),
(10, 0, 1, 0, 2, 0, 2, 3, 0, 0, 0, 0, 0, 0, 'Report a Problem', NULL, 'Product, service, or equipment related issues', '2023-12-15 19:44:33', '2023-12-15 19:44:33'),
(11, 10, 1, 0, 2, 0, 3, 0, 0, 0, 1, 0, 0, 1, 'Access Issue', NULL, 'Report an inability access a physical or virtual asset', '2023-12-15 19:44:33', '2023-12-15 19:44:33');

-- --------------------------------------------------------

--
-- Table structure for table `ost_help_topic_form`
--

CREATE TABLE `ost_help_topic_form` (
  `id` int UNSIGNED NOT NULL,
  `topic_id` int UNSIGNED NOT NULL DEFAULT '0',
  `form_id` int UNSIGNED NOT NULL DEFAULT '0',
  `sort` int UNSIGNED NOT NULL DEFAULT '1',
  `extra` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_help_topic_form`
--

INSERT INTO `ost_help_topic_form` (`id`, `topic_id`, `form_id`, `sort`, `extra`) VALUES
(1, 1, 2, 1, '{\"disable\":[]}'),
(2, 2, 2, 1, '{\"disable\":[]}'),
(3, 10, 2, 1, '{\"disable\":[]}'),
(4, 11, 2, 1, '{\"disable\":[]}');

-- --------------------------------------------------------

--
-- Table structure for table `ost_inventory_asset`
--

CREATE TABLE `ost_inventory_asset` (
  `asset_id` int UNSIGNED NOT NULL,
  `host_name` varchar(255) DEFAULT NULL,
  `manufacturer` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `serial_number` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `assignee` varchar(255) DEFAULT NULL,
  `retired` varchar(5) DEFAULT NULL,
  `created` date NOT NULL,
  `updated` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_inventory__cdata`
--

CREATE TABLE `ost_inventory__cdata` (
  `asset_id` int UNSIGNED NOT NULL,
  `host_name` mediumtext,
  `manufacturer` mediumtext,
  `model` mediumtext,
  `serial_number` mediumtext,
  `location` mediumtext,
  `assignee` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_list`
--

CREATE TABLE `ost_list` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_plural` varchar(255) DEFAULT NULL,
  `sort_mode` enum('Alpha','-Alpha','SortCol') NOT NULL DEFAULT 'Alpha',
  `masks` int UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(16) DEFAULT NULL,
  `configuration` text NOT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_list`
--

INSERT INTO `ost_list` (`id`, `name`, `name_plural`, `sort_mode`, `masks`, `type`, `configuration`, `notes`, `created`, `updated`) VALUES
(1, 'Ticket Status', 'Ticket Statuses', 'SortCol', 13, 'ticket-status', '{\"handler\":\"TicketStatusList\"}', 'Ticket statuses', '2023-12-15 19:44:32', '2023-12-15 19:44:32');

-- --------------------------------------------------------

--
-- Table structure for table `ost_list_items`
--

CREATE TABLE `ost_list_items` (
  `id` int UNSIGNED NOT NULL,
  `list_id` int DEFAULT NULL,
  `status` int UNSIGNED NOT NULL DEFAULT '1',
  `value` varchar(255) NOT NULL,
  `extra` varchar(255) DEFAULT NULL,
  `sort` int NOT NULL DEFAULT '1',
  `properties` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_lock`
--

CREATE TABLE `ost_lock` (
  `lock_id` int UNSIGNED NOT NULL,
  `staff_id` int UNSIGNED NOT NULL DEFAULT '0',
  `expire` datetime DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_note`
--

CREATE TABLE `ost_note` (
  `id` int UNSIGNED NOT NULL,
  `pid` int UNSIGNED DEFAULT NULL,
  `staff_id` int UNSIGNED NOT NULL DEFAULT '0',
  `ext_id` varchar(10) DEFAULT NULL,
  `body` text,
  `status` int UNSIGNED NOT NULL DEFAULT '0',
  `sort` int UNSIGNED NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_organization`
--

CREATE TABLE `ost_organization` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `manager` varchar(16) NOT NULL DEFAULT '',
  `status` int UNSIGNED NOT NULL DEFAULT '0',
  `domain` varchar(256) NOT NULL DEFAULT '',
  `extra` text,
  `created` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_organization`
--

INSERT INTO `ost_organization` (`id`, `name`, `manager`, `status`, `domain`, `extra`, `created`, `updated`) VALUES
(1, 'osTicket', '', 8, '', NULL, '2023-12-15 13:44:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ost_organization__cdata`
--

CREATE TABLE `ost_organization__cdata` (
  `org_id` int UNSIGNED NOT NULL,
  `name` mediumtext,
  `address` mediumtext,
  `phone` mediumtext,
  `website` mediumtext,
  `notes` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_plugin`
--

CREATE TABLE `ost_plugin` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `install_path` varchar(60) NOT NULL,
  `isphar` tinyint(1) NOT NULL DEFAULT '0',
  `isactive` tinyint(1) NOT NULL DEFAULT '0',
  `version` varchar(64) DEFAULT NULL,
  `notes` text,
  `installed` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_plugin`
--

INSERT INTO `ost_plugin` (`id`, `name`, `install_path`, `isphar`, `isactive`, `version`, `notes`, `installed`) VALUES
(1, 'Inventory Manager', 'plugins/osTicket-Inventory-Manager-1.1.5', 0, 1, '1.1.5', '<p>Inventory Asset Management</p>', '2023-12-15 20:13:07');

-- --------------------------------------------------------

--
-- Table structure for table `ost_plugin_instance`
--

CREATE TABLE `ost_plugin_instance` (
  `id` int UNSIGNED NOT NULL,
  `plugin_id` int UNSIGNED NOT NULL,
  `flags` int NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_plugin_instance`
--

INSERT INTO `ost_plugin_instance` (`id`, `plugin_id`, `flags`, `name`, `notes`, `created`, `updated`) VALUES
(1, 1, 1, 'sbuk', '<p>this for test</p>', '2023-12-15 21:01:24', '2023-12-15 21:01:50');

-- --------------------------------------------------------

--
-- Table structure for table `ost_queue`
--

CREATE TABLE `ost_queue` (
  `id` int UNSIGNED NOT NULL,
  `parent_id` int UNSIGNED NOT NULL DEFAULT '0',
  `columns_id` int UNSIGNED DEFAULT NULL,
  `sort_id` int UNSIGNED DEFAULT NULL,
  `flags` int UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int UNSIGNED NOT NULL DEFAULT '0',
  `sort` int UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(60) DEFAULT NULL,
  `config` text,
  `filter` varchar(64) DEFAULT NULL,
  `root` varchar(32) DEFAULT NULL,
  `path` varchar(80) NOT NULL DEFAULT '/',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_queue`
--

INSERT INTO `ost_queue` (`id`, `parent_id`, `columns_id`, `sort_id`, `flags`, `staff_id`, `sort`, `title`, `config`, `filter`, `root`, `path`, `created`, `updated`) VALUES
(1, 0, NULL, 1, 3, 0, 1, 'Open', '[[\"status__state\",\"includes\",{\"open\":\"Open\"}]]', NULL, 'T', '/', '2023-12-15 19:44:37', '0000-00-00 00:00:00'),
(2, 1, NULL, 4, 43, 0, 1, 'Open', '{\"criteria\":[[\"isanswered\",\"nset\",null]],\"conditions\":[]}', NULL, 'T', '/', '2023-12-15 19:44:37', '0000-00-00 00:00:00'),
(3, 1, NULL, 4, 43, 0, 2, 'Answered', '{\"criteria\":[[\"isanswered\",\"set\",null]],\"conditions\":[]}', NULL, 'T', '/', '2023-12-15 19:44:37', '0000-00-00 00:00:00'),
(4, 1, NULL, 4, 43, 0, 3, 'Overdue', '{\"criteria\":[[\"isoverdue\",\"set\",null]],\"conditions\":[]}', NULL, 'T', '/', '2023-12-15 19:44:38', '0000-00-00 00:00:00'),
(5, 0, NULL, 3, 3, 0, 3, 'My Tickets', '{\"criteria\":[[\"assignee\",\"includes\",{\"M\":\"Me\",\"T\":\"One of my teams\"}],[\"status__state\",\"includes\",{\"open\":\"Open\"}]],\"conditions\":[]}', NULL, 'T', '/', '2023-12-15 19:44:38', '0000-00-00 00:00:00'),
(6, 5, NULL, NULL, 43, 0, 1, 'Assigned to Me', '{\"criteria\":[[\"assignee\",\"includes\",{\"M\":\"Me\"}]],\"conditions\":[]}', NULL, 'T', '/', '2023-12-15 19:44:39', '0000-00-00 00:00:00'),
(7, 5, NULL, NULL, 43, 0, 2, 'Assigned to Teams', '{\"criteria\":[[\"assignee\",\"!includes\",{\"M\":\"Me\"}]],\"conditions\":[]}', NULL, 'T', '/', '2023-12-15 19:44:40', '0000-00-00 00:00:00'),
(8, 0, NULL, 5, 3, 0, 4, 'Closed', '{\"criteria\":[[\"status__state\",\"includes\",{\"closed\":\"Closed\"}]],\"conditions\":[]}', NULL, 'T', '/', '2023-12-15 19:44:41', '0000-00-00 00:00:00'),
(9, 8, NULL, 5, 43, 0, 1, 'Today', '{\"criteria\":[[\"closed\",\"period\",\"td\"]],\"conditions\":[]}', NULL, 'T', '/', '2023-12-15 19:44:44', '0000-00-00 00:00:00'),
(10, 8, NULL, 5, 43, 0, 2, 'Yesterday', '{\"criteria\":[[\"closed\",\"period\",\"yd\"]],\"conditions\":[]}', NULL, 'T', '/', '2023-12-15 19:44:45', '0000-00-00 00:00:00'),
(11, 8, NULL, 5, 43, 0, 3, 'This Week', '{\"criteria\":[[\"closed\",\"period\",\"tw\"]],\"conditions\":[]}', NULL, 'T', '/', '2023-12-15 19:44:45', '0000-00-00 00:00:00'),
(12, 8, NULL, 5, 43, 0, 4, 'This Month', '{\"criteria\":[[\"closed\",\"period\",\"tm\"]],\"conditions\":[]}', NULL, 'T', '/', '2023-12-15 19:44:46', '0000-00-00 00:00:00'),
(13, 8, NULL, 6, 43, 0, 5, 'This Quarter', '{\"criteria\":[[\"closed\",\"period\",\"tq\"]],\"conditions\":[]}', NULL, 'T', '/', '2023-12-15 19:44:47', '0000-00-00 00:00:00'),
(14, 8, NULL, 7, 43, 0, 6, 'This Year', '{\"criteria\":[[\"closed\",\"period\",\"ty\"]],\"conditions\":[]}', NULL, 'T', '/', '2023-12-15 19:44:48', '0000-00-00 00:00:00'),
(101, 0, NULL, 8, 47, 0, 7, 'Assets', '[]', NULL, 'U', '/', '2023-12-15 21:01:27', '2023-12-15 21:01:27');

-- --------------------------------------------------------

--
-- Table structure for table `ost_queue_column`
--

CREATE TABLE `ost_queue_column` (
  `id` int UNSIGNED NOT NULL,
  `flags` int UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  `primary` varchar(64) NOT NULL DEFAULT '',
  `secondary` varchar(64) DEFAULT NULL,
  `filter` varchar(32) DEFAULT NULL,
  `truncate` varchar(16) DEFAULT NULL,
  `annotations` text,
  `conditions` text,
  `extra` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_queue_column`
--

INSERT INTO `ost_queue_column` (`id`, `flags`, `name`, `primary`, `secondary`, `filter`, `truncate`, `annotations`, `conditions`, `extra`) VALUES
(1, 0, 'Ticket #', 'number', NULL, 'link:ticketP', 'wrap', '[{\"c\":\"TicketSourceDecoration\",\"p\":\"b\"}]', '[{\"crit\":[\"isanswered\",\"nset\",null],\"prop\":{\"font-weight\":\"bold\"}}]', NULL),
(2, 0, 'Date Created', 'created', NULL, 'date:full', 'wrap', '[]', '[]', NULL),
(3, 0, 'Subject', 'cdata__subject', NULL, 'link:ticket', 'ellipsis', '[{\"c\":\"TicketThreadCount\",\"p\":\">\"},{\"c\":\"ThreadAttachmentCount\",\"p\":\"a\"},{\"c\":\"OverdueFlagDecoration\",\"p\":\"<\"},{\"c\":\"LockDecoration\",\"p\":\"<\"}]', '[{\"crit\":[\"isanswered\",\"nset\",null],\"prop\":{\"font-weight\":\"bold\"}}]', NULL),
(4, 0, 'User Name', 'user__name', NULL, NULL, 'wrap', '[{\"c\":\"ThreadCollaboratorCount\",\"p\":\">\"}]', '[]', NULL),
(5, 0, 'Priority', 'cdata__priority', NULL, NULL, 'wrap', '[]', '[]', NULL),
(6, 0, 'Status', 'status__id', NULL, NULL, 'wrap', '[]', '[]', NULL),
(7, 0, 'Close Date', 'closed', NULL, 'date:full', 'wrap', '[]', '[]', NULL),
(8, 0, 'Assignee', 'assignee', NULL, NULL, 'wrap', '[]', '[]', NULL),
(9, 0, 'Due Date', 'duedate', 'est_duedate', 'date:human', 'wrap', '[]', '[]', NULL),
(10, 0, 'Last Updated', 'lastupdate', NULL, 'date:full', 'wrap', '[]', '[]', NULL),
(11, 0, 'Department', 'dept_id', NULL, NULL, 'wrap', '[]', '[]', NULL),
(12, 0, 'Last Message', 'thread__lastmessage', NULL, 'date:human', 'wrap', '[]', '[]', NULL),
(13, 0, 'Last Response', 'thread__lastresponse', NULL, 'date:human', 'wrap', '[]', '[]', NULL),
(14, 0, 'Team', 'team_id', NULL, NULL, 'wrap', '[]', '[]', NULL),
(15, 0, 'Hostname', 'host_name', NULL, 'link:assetP', '', '[]', '[]', NULL),
(16, 0, 'Model', 'model', NULL, NULL, '', '[]', '[]', NULL),
(17, 0, 'Assignee', 'assignee', NULL, 'link:assignee', '', '[]', '[]', NULL),
(18, 0, 'Location', 'location', NULL, NULL, '', '[]', '[]', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ost_queue_columns`
--

CREATE TABLE `ost_queue_columns` (
  `queue_id` int UNSIGNED NOT NULL,
  `column_id` int UNSIGNED NOT NULL,
  `staff_id` int UNSIGNED NOT NULL,
  `bits` int UNSIGNED NOT NULL DEFAULT '0',
  `sort` int UNSIGNED NOT NULL DEFAULT '1',
  `heading` varchar(64) DEFAULT NULL,
  `width` int UNSIGNED NOT NULL DEFAULT '100'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_queue_columns`
--

INSERT INTO `ost_queue_columns` (`queue_id`, `column_id`, `staff_id`, `bits`, `sort`, `heading`, `width`) VALUES
(1, 1, 0, 1, 1, 'Ticket', 100),
(1, 3, 0, 1, 3, 'Subject', 300),
(1, 4, 0, 1, 4, 'From', 185),
(1, 5, 0, 1, 5, 'Priority', 85),
(1, 8, 0, 1, 6, 'Assigned To', 160),
(1, 10, 0, 1, 2, 'Last Updated', 150),
(2, 1, 0, 1, 1, 'Ticket', 100),
(2, 3, 0, 1, 3, 'Subject', 300),
(2, 4, 0, 1, 4, 'From', 185),
(2, 5, 0, 1, 5, 'Priority', 85),
(2, 8, 0, 1, 6, 'Assigned To', 160),
(2, 10, 0, 1, 2, 'Last Updated', 150),
(3, 1, 0, 1, 1, 'Ticket', 100),
(3, 3, 0, 1, 3, 'Subject', 300),
(3, 4, 0, 1, 4, 'From', 185),
(3, 5, 0, 1, 5, 'Priority', 85),
(3, 8, 0, 1, 6, 'Assigned To', 160),
(3, 10, 0, 1, 2, 'Last Updated', 150),
(4, 1, 0, 1, 1, 'Ticket', 100),
(4, 3, 0, 1, 3, 'Subject', 300),
(4, 4, 0, 1, 4, 'From', 185),
(4, 5, 0, 1, 5, 'Priority', 85),
(4, 8, 0, 1, 6, 'Assigned To', 160),
(4, 9, 0, 1, 9, 'Due Date', 150),
(5, 1, 0, 1, 1, 'Ticket', 100),
(5, 3, 0, 1, 3, 'Subject', 300),
(5, 4, 0, 1, 4, 'From', 185),
(5, 5, 0, 1, 5, 'Priority', 85),
(5, 10, 0, 1, 2, 'Last Update', 150),
(5, 11, 0, 1, 6, 'Department', 160),
(6, 1, 0, 1, 1, 'Ticket', 100),
(6, 3, 0, 1, 3, 'Subject', 300),
(6, 4, 0, 1, 4, 'From', 185),
(6, 5, 0, 1, 5, 'Priority', 85),
(6, 10, 0, 1, 2, 'Last Update', 150),
(6, 11, 0, 1, 6, 'Department', 160),
(7, 1, 0, 1, 1, 'Ticket', 100),
(7, 3, 0, 1, 3, 'Subject', 300),
(7, 4, 0, 1, 4, 'From', 185),
(7, 5, 0, 1, 5, 'Priority', 85),
(7, 10, 0, 1, 2, 'Last Update', 150),
(7, 14, 0, 1, 6, 'Team', 160),
(8, 1, 0, 1, 1, 'Ticket', 100),
(8, 3, 0, 1, 3, 'Subject', 300),
(8, 4, 0, 1, 4, 'From', 185),
(8, 7, 0, 1, 2, 'Date Closed', 150),
(8, 8, 0, 1, 6, 'Closed By', 160),
(9, 1, 0, 1, 1, 'Ticket', 100),
(9, 3, 0, 1, 3, 'Subject', 300),
(9, 4, 0, 1, 4, 'From', 185),
(9, 7, 0, 1, 2, 'Date Closed', 150),
(9, 8, 0, 1, 6, 'Closed By', 160),
(10, 1, 0, 1, 1, 'Ticket', 100),
(10, 3, 0, 1, 3, 'Subject', 300),
(10, 4, 0, 1, 4, 'From', 185),
(10, 7, 0, 1, 2, 'Date Closed', 150),
(10, 8, 0, 1, 6, 'Closed By', 160),
(11, 1, 0, 1, 1, 'Ticket', 100),
(11, 3, 0, 1, 3, 'Subject', 300),
(11, 4, 0, 1, 4, 'From', 185),
(11, 7, 0, 1, 2, 'Date Closed', 150),
(11, 8, 0, 1, 6, 'Closed By', 160),
(12, 1, 0, 1, 1, 'Ticket', 100),
(12, 3, 0, 1, 3, 'Subject', 300),
(12, 4, 0, 1, 4, 'From', 185),
(12, 7, 0, 1, 2, 'Date Closed', 150),
(12, 8, 0, 1, 6, 'Closed By', 160),
(13, 1, 0, 1, 1, 'Ticket', 100),
(13, 3, 0, 1, 3, 'Subject', 300),
(13, 4, 0, 1, 4, 'From', 185),
(13, 7, 0, 1, 2, 'Date Closed', 150),
(13, 8, 0, 1, 6, 'Closed By', 160),
(14, 1, 0, 1, 1, 'Ticket', 100),
(14, 3, 0, 1, 3, 'Subject', 300),
(14, 4, 0, 1, 4, 'From', 185),
(14, 7, 0, 1, 2, 'Date Closed', 150),
(14, 8, 0, 1, 6, 'Closed By', 160);

-- --------------------------------------------------------

--
-- Table structure for table `ost_queue_config`
--

CREATE TABLE `ost_queue_config` (
  `queue_id` int UNSIGNED NOT NULL,
  `staff_id` int UNSIGNED NOT NULL,
  `setting` text,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_queue_export`
--

CREATE TABLE `ost_queue_export` (
  `id` int UNSIGNED NOT NULL,
  `queue_id` int UNSIGNED NOT NULL,
  `path` varchar(64) NOT NULL DEFAULT '',
  `heading` varchar(64) DEFAULT NULL,
  `sort` int UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_queue_sort`
--

CREATE TABLE `ost_queue_sort` (
  `id` int UNSIGNED NOT NULL,
  `root` varchar(32) DEFAULT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `columns` text,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_queue_sort`
--

INSERT INTO `ost_queue_sort` (`id`, `root`, `name`, `columns`, `updated`) VALUES
(1, NULL, 'Priority + Most Recently Updated', '[\"-cdata__priority\",\"-lastupdate\"]', '2023-12-15 19:44:36'),
(2, NULL, 'Priority + Most Recently Created', '[\"-cdata__priority\",\"-created\"]', '2023-12-15 19:44:37'),
(3, NULL, 'Priority + Due Date', '[\"-cdata__priority\",\"-est_duedate\"]', '2023-12-15 19:44:37'),
(4, NULL, 'Due Date', '[\"-est_duedate\"]', '2023-12-15 19:44:37'),
(5, NULL, 'Closed Date', '[\"-closed\"]', '2023-12-15 19:44:37'),
(6, NULL, 'Create Date', '[\"-created\"]', '2023-12-15 19:44:37'),
(7, NULL, 'Update Date', '[\"-lastupdate\"]', '2023-12-15 19:44:37');

-- --------------------------------------------------------

--
-- Table structure for table `ost_queue_sorts`
--

CREATE TABLE `ost_queue_sorts` (
  `queue_id` int UNSIGNED NOT NULL,
  `sort_id` int UNSIGNED NOT NULL,
  `bits` int UNSIGNED NOT NULL DEFAULT '0',
  `sort` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_queue_sorts`
--

INSERT INTO `ost_queue_sorts` (`queue_id`, `sort_id`, `bits`, `sort`) VALUES
(1, 1, 0, 0),
(1, 2, 0, 0),
(1, 3, 0, 0),
(1, 4, 0, 0),
(1, 6, 0, 0),
(1, 7, 0, 0),
(5, 1, 0, 0),
(5, 2, 0, 0),
(5, 3, 0, 0),
(5, 4, 0, 0),
(5, 6, 0, 0),
(5, 7, 0, 0),
(6, 1, 0, 0),
(6, 2, 0, 0),
(6, 3, 0, 0),
(6, 4, 0, 0),
(6, 6, 0, 0),
(6, 7, 0, 0),
(7, 1, 0, 0),
(7, 2, 0, 0),
(7, 3, 0, 0),
(7, 4, 0, 0),
(7, 6, 0, 0),
(7, 7, 0, 0),
(8, 1, 0, 0),
(8, 2, 0, 0),
(8, 3, 0, 0),
(8, 4, 0, 0),
(8, 5, 0, 0),
(8, 6, 0, 0),
(8, 7, 0, 0),
(9, 1, 0, 0),
(9, 2, 0, 0),
(9, 3, 0, 0),
(9, 4, 0, 0),
(9, 5, 0, 0),
(9, 6, 0, 0),
(9, 7, 0, 0),
(10, 1, 0, 0),
(10, 2, 0, 0),
(10, 3, 0, 0),
(10, 4, 0, 0),
(10, 5, 0, 0),
(10, 6, 0, 0),
(10, 7, 0, 0),
(11, 1, 0, 0),
(11, 2, 0, 0),
(11, 3, 0, 0),
(11, 4, 0, 0),
(11, 5, 0, 0),
(11, 6, 0, 0),
(11, 7, 0, 0),
(12, 1, 0, 0),
(12, 2, 0, 0),
(12, 3, 0, 0),
(12, 4, 0, 0),
(12, 5, 0, 0),
(12, 6, 0, 0),
(12, 7, 0, 0),
(13, 1, 0, 0),
(13, 2, 0, 0),
(13, 3, 0, 0),
(13, 4, 0, 0),
(13, 5, 0, 0),
(13, 6, 0, 0),
(13, 7, 0, 0),
(14, 1, 0, 0),
(14, 2, 0, 0),
(14, 3, 0, 0),
(14, 4, 0, 0),
(14, 5, 0, 0),
(14, 6, 0, 0),
(14, 7, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ost_role`
--

CREATE TABLE `ost_role` (
  `id` int UNSIGNED NOT NULL,
  `flags` int UNSIGNED NOT NULL DEFAULT '1',
  `name` varchar(64) DEFAULT NULL,
  `permissions` text,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_role`
--

INSERT INTO `ost_role` (`id`, `flags`, `name`, `permissions`, `notes`, `created`, `updated`) VALUES
(1, 1, 'All Access', '{\"ticket.assign\":1,\"ticket.close\":1,\"ticket.create\":1,\"ticket.delete\":1,\"ticket.edit\":1,\"thread.edit\":1,\"ticket.link\":1,\"ticket.markanswered\":1,\"ticket.merge\":1,\"ticket.reply\":1,\"ticket.refer\":1,\"ticket.release\":1,\"ticket.transfer\":1,\"task.assign\":1,\"task.close\":1,\"task.create\":1,\"task.delete\":1,\"task.edit\":1,\"task.reply\":1,\"task.transfer\":1,\"canned.manage\":1}', 'Role with unlimited access', '2023-12-15 19:44:35', '2023-12-15 19:44:35'),
(2, 1, 'Expanded Access', '{\"ticket.assign\":1,\"ticket.close\":1,\"ticket.create\":1,\"ticket.edit\":1,\"ticket.link\":1,\"ticket.merge\":1,\"ticket.reply\":1,\"ticket.refer\":1,\"ticket.release\":1,\"ticket.transfer\":1,\"task.assign\":1,\"task.close\":1,\"task.create\":1,\"task.edit\":1,\"task.reply\":1,\"task.transfer\":1,\"canned.manage\":1}', 'Role with expanded access', '2023-12-15 19:44:35', '2023-12-15 19:44:35'),
(3, 1, 'Limited Access', '{\"ticket.assign\":1,\"ticket.create\":1,\"ticket.link\":1,\"ticket.merge\":1,\"ticket.refer\":1,\"ticket.release\":1,\"ticket.transfer\":1,\"task.assign\":1,\"task.reply\":1,\"task.transfer\":1}', 'Role with limited access', '2023-12-15 19:44:35', '2023-12-15 19:44:35'),
(4, 1, 'View only', NULL, 'Simple role with no permissions', '2023-12-15 19:44:35', '2023-12-15 19:44:35');

-- --------------------------------------------------------

--
-- Table structure for table `ost_schedule`
--

CREATE TABLE `ost_schedule` (
  `id` int UNSIGNED NOT NULL,
  `flags` int UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `timezone` varchar(64) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_schedule`
--

INSERT INTO `ost_schedule` (`id`, `flags`, `name`, `timezone`, `description`, `created`, `updated`) VALUES
(1, 1, 'Monday - Friday 8am - 5pm with U.S. Holidays', NULL, '', '2023-12-15 19:44:48', '2023-12-15 19:44:48'),
(2, 1, '24/7', NULL, '', '2023-12-15 19:44:49', '2023-12-15 19:44:49'),
(3, 1, '24/5', NULL, '', '2023-12-15 19:44:49', '2023-12-15 19:44:49'),
(4, 0, 'U.S. Holidays', NULL, '', '2023-12-15 19:44:49', '2023-12-15 19:44:49');

-- --------------------------------------------------------

--
-- Table structure for table `ost_schedule_entry`
--

CREATE TABLE `ost_schedule_entry` (
  `id` int UNSIGNED NOT NULL,
  `schedule_id` int UNSIGNED NOT NULL DEFAULT '0',
  `flags` int UNSIGNED NOT NULL DEFAULT '0',
  `sort` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `repeats` varchar(16) NOT NULL DEFAULT 'never',
  `starts_on` date DEFAULT NULL,
  `starts_at` time DEFAULT NULL,
  `ends_on` date DEFAULT NULL,
  `ends_at` time DEFAULT NULL,
  `stops_on` datetime DEFAULT NULL,
  `day` tinyint DEFAULT NULL,
  `week` tinyint DEFAULT NULL,
  `month` tinyint DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_schedule_entry`
--

INSERT INTO `ost_schedule_entry` (`id`, `schedule_id`, `flags`, `sort`, `name`, `repeats`, `starts_on`, `starts_at`, `ends_on`, `ends_at`, `stops_on`, `day`, `week`, `month`, `created`, `updated`) VALUES
(1, 1, 0, 0, 'Monday', 'weekly', '2019-01-07', '08:00:00', '2019-01-07', '17:00:00', NULL, 1, NULL, NULL, '0000-00-00 00:00:00', '2023-12-15 19:44:48'),
(2, 1, 0, 0, 'Tuesday', 'weekly', '2019-01-08', '08:00:00', '2019-01-08', '17:00:00', NULL, 2, NULL, NULL, '0000-00-00 00:00:00', '2023-12-15 19:44:49'),
(3, 1, 0, 0, 'Wednesday', 'weekly', '2019-01-09', '08:00:00', '2019-01-09', '17:00:00', NULL, 3, NULL, NULL, '0000-00-00 00:00:00', '2023-12-15 19:44:49'),
(4, 1, 0, 0, 'Thursday', 'weekly', '2019-01-10', '08:00:00', '2019-01-10', '17:00:00', NULL, 4, NULL, NULL, '0000-00-00 00:00:00', '2023-12-15 19:44:49'),
(5, 1, 0, 0, 'Friday', 'weekly', '2019-01-11', '08:00:00', '2019-01-11', '17:00:00', NULL, 5, NULL, NULL, '0000-00-00 00:00:00', '2023-12-15 19:44:49'),
(6, 2, 0, 0, 'Daily', 'daily', '2019-01-01', '00:00:00', '2019-01-01', '23:59:59', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '2023-12-15 19:44:49'),
(7, 3, 0, 0, 'Weekdays', 'weekdays', '2019-01-01', '00:00:00', '2019-01-01', '23:59:59', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '2023-12-15 19:44:49'),
(8, 4, 0, 0, 'New Year\'s Day', 'yearly', '2019-01-01', '00:00:00', '2019-01-01', '23:59:59', NULL, 1, NULL, 1, '0000-00-00 00:00:00', '2023-12-15 19:44:49'),
(9, 4, 0, 0, 'MLK Day', 'yearly', '2019-01-21', '00:00:00', '2019-01-21', '23:59:59', NULL, 1, 3, 1, '0000-00-00 00:00:00', '2023-12-15 19:44:49'),
(10, 4, 0, 0, 'Memorial Day', 'yearly', '2019-05-27', '00:00:00', '2019-05-27', '23:59:59', NULL, 1, -1, 5, '0000-00-00 00:00:00', '2023-12-15 19:44:49'),
(11, 4, 0, 0, 'Independence Day (4th of July)', 'yearly', '2019-07-04', '00:00:00', '2019-07-04', '23:59:59', NULL, 4, NULL, 7, '0000-00-00 00:00:00', '2023-12-15 19:44:49'),
(12, 4, 0, 0, 'Labor Day', 'yearly', '2019-09-02', '00:00:00', '2019-09-02', '23:59:59', NULL, 1, 1, 9, '0000-00-00 00:00:00', '2023-12-15 19:44:49'),
(13, 4, 0, 0, 'Indigenous Peoples\' Day (Whodat Columbus)', 'yearly', '2019-10-14', '00:00:00', '2019-10-14', '23:59:59', NULL, 1, 2, 10, '0000-00-00 00:00:00', '2023-12-15 19:44:49'),
(14, 4, 0, 0, 'Veterans Day', 'yearly', '2019-11-11', '00:00:00', '2019-11-11', '23:59:59', NULL, 11, NULL, 11, '0000-00-00 00:00:00', '2023-12-15 19:44:49'),
(15, 4, 0, 0, 'Thanksgiving Day', 'yearly', '2019-11-28', '00:00:00', '2019-11-28', '23:59:59', NULL, 4, 4, 11, '0000-00-00 00:00:00', '2023-12-15 19:44:49'),
(16, 4, 0, 0, 'Christmas Day', 'yearly', '2019-11-25', '00:00:00', '2019-11-25', '23:59:59', NULL, 25, NULL, 12, '0000-00-00 00:00:00', '2023-12-15 19:44:49');

-- --------------------------------------------------------

--
-- Table structure for table `ost_sequence`
--

CREATE TABLE `ost_sequence` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `flags` int UNSIGNED DEFAULT NULL,
  `next` bigint UNSIGNED NOT NULL DEFAULT '1',
  `increment` int DEFAULT '1',
  `padding` char(1) DEFAULT '0',
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_sequence`
--

INSERT INTO `ost_sequence` (`id`, `name`, `flags`, `next`, `increment`, `padding`, `updated`) VALUES
(1, 'General Tickets', 1, 1, 1, '0', '0000-00-00 00:00:00'),
(2, 'Tasks Sequence', 1, 1, 1, '0', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ost_session`
--

CREATE TABLE `ost_session` (
  `session_id` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `session_data` blob,
  `session_expire` datetime DEFAULT NULL,
  `session_updated` datetime DEFAULT NULL,
  `user_id` varchar(16) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0' COMMENT 'osTicket staff/client ID',
  `user_ip` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `ost_session`
--

INSERT INTO `ost_session` (`session_id`, `session_data`, `session_expire`, `session_updated`, `user_id`, `user_ip`, `user_agent`) VALUES
('0nsjpugq9u8isi1ggngpljnnj4', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2238326532303062396637373063356639316132363831303162393766616465323530333033663663223b733a343a2274696d65223b693a313730323635323337343b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a353a222f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31343a226c6f63616c3a6465766e7a69616e223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2261663931666565386634323238383337306131666265363766336236633033653a313730323635323336353a6335623738386164613966376538653762653262343932373336303739353266223b7d54494d455f424f4d427c693a313730323635323337353b3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032332d31322d31352031393a34343a3336223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b7d733a333a22646972223b693a303b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31303a22417369612f4468616b61223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e6f5f77794f4e6b74305f525a66386f77366e6f5f597543434c6a467851503932223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a313b733a323a227132223b643a313b733a323a227136223b643a303b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a303b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313730323635323336363b7d7d6c61737463726f6e63616c6c7c693a313730323635323336373b5454447c693a313730323635323531313b, '2023-12-15 21:01:51', '2023-12-15 20:59:51', '1', '172.28.16.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'),
('5894vdkd7bgf2qm5cssrceau5d', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2233666464353537316464356565383030346138663233366263383039363965633163663937393961223b733a343a2274696d65223b693a313730323634393639333b7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31343a226c6f63616c3a6465766e7a69616e223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2236383739356565383431663639336332303466363962396361663232353137393a313730323634393638333a6335623738386164613966376538653762653262343932373336303739353266223b7d54494d455f424f4d427c693a313730323634393639333b3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032332d31322d31352031393a34343a3336223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b7d733a333a22646972223b693a303b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31303a22417369612f4468616b61223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e6f5f77794f4e6b74305f525a66386f77366e6f5f597543434c6a467851503932223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a313b733a323a227132223b643a313b733a323a227136223b643a303b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a303b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313730323634393638363b7d7d6c61737463726f6e63616c6c7c693a313730323634393638363b5454447c693a313730323634393831393b, '2023-12-15 20:16:59', '2023-12-15 20:14:59', '1', '172.28.16.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'),
('693llcfpckfi01boe5it817usb', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2262633162373733396161323261623639363862636563343430363934313462646364636132376266223b733a343a2274696d65223b693a313730323635393030353b7d5f73746166667c613a313a7b733a343a2261757468223b613a313a7b733a333a226d7367223b733a32353a2256616c6964204353524620546f6b656e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31343a226c6f63616c3a6465766e7a69616e223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2238336235623334313762363438653130653566383631623535326630366164313a313730323635393030333a6335623738386164613966376538653762653262343932373336303739353266223b7d54494d455f424f4d427c693a313730323636313035343b3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032332d31322d31352031393a34343a3336223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b7d733a333a22646972223b693a303b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31303a22417369612f4468616b61223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e6f5f77794f4e6b74305f525a66386f77366e6f5f597543434c6a467851503932223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a313b733a323a227132223b643a313b733a323a227136223b643a303b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a303b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313730323635393030343b7d7d6c61737463726f6e63616c6c7c693a313730323635393030353b, '2023-12-15 23:24:14', '2023-12-15 22:54:14', '1', '172.28.16.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'),
('73qnkbuuhkd5urn48aurumnpj5', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2236323366323234653864303333386533636462663437633238373639623961663836613437653861223b733a343a2274696d65223b693a313730323634393835313b7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31343a226c6f63616c3a6465766e7a69616e223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2234353432343534633930613931383362366334303634613538326638373930663a313730323634393834333a6335623738386164613966376538653762653262343932373336303739353266223b7d54494d455f424f4d427c693a313730323634393835333b3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032332d31322d31352031393a34343a3336223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b7d733a333a22646972223b693a303b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31303a22417369612f4468616b61223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e6f5f77794f4e6b74305f525a66386f77366e6f5f597543434c6a467851503932223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a313b733a323a227132223b643a313b733a323a227136223b643a303b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a303b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313730323634393834343b7d7d6c61737463726f6e63616c6c7c693a313730323634393834353b5454447c693a313730323635303130333b, '2023-12-15 20:21:43', '2023-12-15 20:19:43', '1', '172.28.16.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'),
('chkf3r68e46rpcn50ou90dhmib', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2262633162373733396161323261623639363862636563343430363934313462646364636132376266223b733a343a2274696d65223b693a313730323635393030353b7d5f73746166667c613a313a7b733a343a2261757468223b613a313a7b733a333a226d7367223b733a32353a2256616c6964204353524620546f6b656e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31343a226c6f63616c3a6465766e7a69616e223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2238336235623334313762363438653130653566383631623535326630366164313a313730323635393030333a6335623738386164613966376538653762653262343932373336303739353266223b7d54494d455f424f4d427c693a313730323635393031333b3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032332d31322d31352031393a34343a3336223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b7d733a333a22646972223b693a303b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31303a22417369612f4468616b61223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e6f5f77794f4e6b74305f525a66386f77366e6f5f597543434c6a467851503932223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a313b733a323a227132223b643a313b733a323a227136223b643a303b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a303b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313730323635393030343b7d7d6c61737463726f6e63616c6c7c693a313730323635393030353b5454447c693a313730323635393337343b, '2023-12-15 22:56:14', '2023-12-15 22:54:14', '1', '172.28.16.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'),
('cnv5nnu11r061bdeasb5s6ac1f', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2230333130393664613861653263393462663931313037656139643035653833393835656239323732223b733a343a2274696d65223b693a313730323635343138363b7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2023-12-16 21:29:46', '2023-12-15 21:29:46', '0', '172.28.16.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'),
('fh7a9lcqouhcfi8t5not92mghl', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2262303431326435313836383037393966616439396134313437316538363364323335346164343365223b733a343a2274696d65223b693a313730323635363731343b7d5f73746166667c613a313a7b733a343a2261757468223b613a313a7b733a333a226d7367223b733a32353a2256616c6964204353524620546f6b656e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2023-12-16 22:11:54', '2023-12-15 22:11:54', '0', '172.28.16.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'),
('gf9q1ptq6ts9gi07u348svvgnt', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2266366163663566303732363661326632346630356433626366626539336332343365623939656534223b733a343a2274696d65223b693a313730323634383036383b7d5f617574687c613a323a7b733a343a2275736572223b613a313a7b733a373a22737472696b6573223b693a343b7d733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31343a226c6f63616c3a6465766e7a69616e223b733a333a22326661223b4e3b7d7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31343a222f7363702f61646d696e2e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2239643366343664626531366665633432326232636437323430393332353136353a313730323634383036353a6335623738386164613966376538653762653262343932373336303739353266223b7d54494d455f424f4d427c693a313730323634383037353b6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31303a22417369612f4468616b61223b7d6c61737463726f6e63616c6c7c693a313730323634383036383b5454447c693a313730323634383237313b, '2023-12-15 19:51:12', '2023-12-15 19:49:12', '1', '172.28.16.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'),
('vk3hfd6nres9jkted5mvdda4jt', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2263653531663131396330663661633962373832343364663733633065666435613336653063653062223b733a343a2274696d65223b693a313730323635303038343b7d5f617574687c613a313a7b733a353a227374616666223b4e3b7d, '2023-12-16 20:21:24', '2023-12-15 20:21:24', '0', '172.28.16.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36');

-- --------------------------------------------------------

--
-- Table structure for table `ost_sla`
--

CREATE TABLE `ost_sla` (
  `id` int UNSIGNED NOT NULL,
  `schedule_id` int UNSIGNED NOT NULL DEFAULT '0',
  `flags` int UNSIGNED NOT NULL DEFAULT '3',
  `grace_period` int UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_sla`
--

INSERT INTO `ost_sla` (`id`, `schedule_id`, `flags`, `grace_period`, `name`, `notes`, `created`, `updated`) VALUES
(1, 0, 3, 18, 'Default SLA', NULL, '2023-12-15 19:44:19', '2023-12-15 19:44:19');

-- --------------------------------------------------------

--
-- Table structure for table `ost_staff`
--

CREATE TABLE `ost_staff` (
  `staff_id` int UNSIGNED NOT NULL,
  `dept_id` int UNSIGNED NOT NULL DEFAULT '0',
  `role_id` int UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(32) NOT NULL DEFAULT '',
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `passwd` varchar(128) DEFAULT NULL,
  `backend` varchar(32) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(24) NOT NULL DEFAULT '',
  `phone_ext` varchar(6) DEFAULT NULL,
  `mobile` varchar(24) NOT NULL DEFAULT '',
  `signature` text NOT NULL,
  `lang` varchar(16) DEFAULT NULL,
  `timezone` varchar(64) DEFAULT NULL,
  `locale` varchar(16) DEFAULT NULL,
  `notes` text,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `isvisible` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `onvacation` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `assigned_only` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `show_assigned_tickets` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `change_passwd` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `max_page_size` int UNSIGNED NOT NULL DEFAULT '0',
  `auto_refresh_rate` int UNSIGNED NOT NULL DEFAULT '0',
  `default_signature_type` enum('none','mine','dept') NOT NULL DEFAULT 'none',
  `default_paper_size` enum('Letter','Legal','Ledger','A4','A3') NOT NULL DEFAULT 'Letter',
  `extra` text,
  `permissions` text,
  `created` datetime NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `passwdreset` datetime DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_staff`
--

INSERT INTO `ost_staff` (`staff_id`, `dept_id`, `role_id`, `username`, `firstname`, `lastname`, `passwd`, `backend`, `email`, `phone`, `phone_ext`, `mobile`, `signature`, `lang`, `timezone`, `locale`, `notes`, `isactive`, `isadmin`, `isvisible`, `onvacation`, `assigned_only`, `show_assigned_tickets`, `change_passwd`, `max_page_size`, `auto_refresh_rate`, `default_signature_type`, `default_paper_size`, `extra`, `permissions`, `created`, `lastlogin`, `passwdreset`, `updated`) VALUES
(1, 1, 1, 'devnzian', 'Zia', 'Uddin', '$2a$08$IT4Q4kXVqk5MDjLF0HhCAOC3rvSFBz1.REedl8L5tZ72DDathF.F6', NULL, 'robin.zitf@gmail.com', '', NULL, '', '', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, 0, 0, 25, 0, 'none', 'Letter', '{\"browser_lang\":\"en_US\"}', '{\"user.create\":1,\"user.delete\":1,\"user.edit\":1,\"user.manage\":1,\"user.dir\":1,\"org.create\":1,\"org.delete\":1,\"org.edit\":1,\"faq.manage\":1,\"visibility.agents\":1,\"emails.banlist\":1,\"visibility.departments\":1}', '2023-12-15 19:45:04', '2023-12-15 22:50:03', '2023-12-15 19:45:04', '2023-12-15 22:50:03');

-- --------------------------------------------------------

--
-- Table structure for table `ost_staff_dept_access`
--

CREATE TABLE `ost_staff_dept_access` (
  `staff_id` int UNSIGNED NOT NULL DEFAULT '0',
  `dept_id` int UNSIGNED NOT NULL DEFAULT '0',
  `role_id` int UNSIGNED NOT NULL DEFAULT '0',
  `flags` int UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_staff_dept_access`
--

INSERT INTO `ost_staff_dept_access` (`staff_id`, `dept_id`, `role_id`, `flags`) VALUES
(1, 2, 1, 1),
(1, 3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ost_syslog`
--

CREATE TABLE `ost_syslog` (
  `log_id` int UNSIGNED NOT NULL,
  `log_type` enum('Debug','Warning','Error') NOT NULL,
  `title` varchar(255) NOT NULL,
  `log` text NOT NULL,
  `logger` varchar(64) NOT NULL,
  `ip_address` varchar(64) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_syslog`
--

INSERT INTO `ost_syslog` (`log_id`, `log_type`, `title`, `log`, `logger`, `ip_address`, `created`, `updated`) VALUES
(1, 'Debug', 'osTicket installed!', 'Congratulations osTicket basic installation completed!\n\nThank you for choosing osTicket!', '', '172.28.16.1', '2023-12-15 19:45:09', '2023-12-15 19:45:09'),
(2, 'Warning', 'Failed login attempt (user)', 'Username: nzianit@gmail.com IP: 172.28.16.1 Time: Dec 15, 2023, 1:47 pm UTC Attempts: 3', '', '172.28.16.1', '2023-12-15 19:47:12', '2023-12-15 19:47:12'),
(3, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [031096da8ae2c94bf91107ea9d05e83985eb9272] on http://dev.osticket:8080/scp/login.php', '', '172.28.16.1', '2023-12-15 22:11:54', '2023-12-15 22:11:54'),
(4, 'Warning', 'Invalid CSRF Token __CSRFToken__', 'Invalid CSRF token [b0412d518680799fad99a41471e863d2354ad43e] on http://dev.osticket:8080/scp/login.php', '', '172.28.16.1', '2023-12-15 22:49:56', '2023-12-15 22:49:56');

-- --------------------------------------------------------

--
-- Table structure for table `ost_task`
--

CREATE TABLE `ost_task` (
  `id` int UNSIGNED NOT NULL,
  `object_id` int NOT NULL DEFAULT '0',
  `object_type` char(1) NOT NULL,
  `number` varchar(20) DEFAULT NULL,
  `dept_id` int UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int UNSIGNED NOT NULL DEFAULT '0',
  `team_id` int UNSIGNED NOT NULL DEFAULT '0',
  `lock_id` int UNSIGNED NOT NULL DEFAULT '0',
  `flags` int UNSIGNED NOT NULL DEFAULT '0',
  `duedate` datetime DEFAULT NULL,
  `closed` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_task__cdata`
--

CREATE TABLE `ost_task__cdata` (
  `task_id` int UNSIGNED NOT NULL,
  `title` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_team`
--

CREATE TABLE `ost_team` (
  `team_id` int UNSIGNED NOT NULL,
  `lead_id` int UNSIGNED NOT NULL DEFAULT '0',
  `flags` int UNSIGNED NOT NULL DEFAULT '1',
  `name` varchar(125) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_team`
--

INSERT INTO `ost_team` (`team_id`, `lead_id`, `flags`, `name`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 'Level I Support', 'Tier 1 support, responsible for the initial iteraction with customers', '2023-12-15 19:44:34', '2023-12-15 19:44:34');

-- --------------------------------------------------------

--
-- Table structure for table `ost_team_member`
--

CREATE TABLE `ost_team_member` (
  `team_id` int UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int UNSIGNED NOT NULL,
  `flags` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_thread`
--

CREATE TABLE `ost_thread` (
  `id` int UNSIGNED NOT NULL,
  `object_id` int UNSIGNED NOT NULL,
  `object_type` char(1) NOT NULL,
  `extra` text,
  `lastresponse` datetime DEFAULT NULL,
  `lastmessage` datetime DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_thread`
--

INSERT INTO `ost_thread` (`id`, `object_id`, `object_type`, `extra`, `lastresponse`, `lastmessage`, `created`) VALUES
(1, 1, 'T', NULL, NULL, '2023-12-15 19:45:06', '2023-12-15 19:45:06');

-- --------------------------------------------------------

--
-- Table structure for table `ost_thread_collaborator`
--

CREATE TABLE `ost_thread_collaborator` (
  `id` int UNSIGNED NOT NULL,
  `flags` int UNSIGNED NOT NULL DEFAULT '1',
  `thread_id` int UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `role` char(1) NOT NULL DEFAULT 'M',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_thread_entry`
--

CREATE TABLE `ost_thread_entry` (
  `id` int UNSIGNED NOT NULL,
  `pid` int UNSIGNED NOT NULL DEFAULT '0',
  `thread_id` int UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `type` char(1) NOT NULL DEFAULT '',
  `flags` int UNSIGNED NOT NULL DEFAULT '0',
  `poster` varchar(128) NOT NULL DEFAULT '',
  `editor` int UNSIGNED DEFAULT NULL,
  `editor_type` char(1) DEFAULT NULL,
  `source` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(255) DEFAULT NULL,
  `body` text NOT NULL,
  `format` varchar(16) NOT NULL DEFAULT 'html',
  `ip_address` varchar(64) NOT NULL DEFAULT '',
  `extra` text,
  `recipients` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_thread_entry`
--

INSERT INTO `ost_thread_entry` (`id`, `pid`, `thread_id`, `staff_id`, `user_id`, `type`, `flags`, `poster`, `editor`, `editor_type`, `source`, `title`, `body`, `format`, `ip_address`, `extra`, `recipients`, `created`, `updated`) VALUES
(1, 0, 1, 0, 1, 'M', 65, 'osTicket Team', NULL, NULL, 'Web', 'osTicket Installed!', ' <p>Thank you for choosing osTicket. </p> <p>Please make sure you join the <a href=\"https://forum.osticket.com\">osTicket forums</a> and our <a href=\"https://osticket.com\">mailing list</a> to stay up to date on the latest news, security alerts and updates. The osTicket forums are also a great place to get assistance, guidance, tips, and help from other osTicket users. In addition to the forums, the <a href=\"https://docs.osticket.com\">osTicket Docs</a> provides a useful collection of educational materials, documentation, and notes from the community. We welcome your contributions to the osTicket community. </p> <p>If you are looking for a greater level of support, we provide professional services and commercial support with guaranteed response times, and access to the core development team. We can also help customize osTicket or even add new features to the system to meet your unique needs. </p> <p>If the idea of managing and upgrading this osTicket installation is daunting, you can try osTicket as a hosted service at <a href=\"https://supportsystem.com\">https://supportsystem.com/</a> -- no installation required and we can import your data! With SupportSystem\'s turnkey infrastructure, you get osTicket at its best, leaving you free to focus on your customers without the burden of making sure the application is stable, maintained, and secure. </p> <p>Cheers, </p> <p>-<br /> osTicket Team - https://osticket.com/ </p> <p><strong>PS.</strong> Don\'t just make customers happy, make happy customers! </p>', 'html', '172.28.16.1', NULL, NULL, '2023-12-15 19:45:06', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ost_thread_entry_email`
--

CREATE TABLE `ost_thread_entry_email` (
  `id` int UNSIGNED NOT NULL,
  `thread_entry_id` int UNSIGNED NOT NULL,
  `email_id` int UNSIGNED DEFAULT NULL,
  `mid` varchar(255) NOT NULL,
  `headers` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_thread_entry_merge`
--

CREATE TABLE `ost_thread_entry_merge` (
  `id` int UNSIGNED NOT NULL,
  `thread_entry_id` int UNSIGNED NOT NULL,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_thread_event`
--

CREATE TABLE `ost_thread_event` (
  `id` int UNSIGNED NOT NULL,
  `thread_id` int UNSIGNED NOT NULL DEFAULT '0',
  `thread_type` char(1) NOT NULL DEFAULT '',
  `event_id` int UNSIGNED DEFAULT NULL,
  `staff_id` int UNSIGNED NOT NULL,
  `team_id` int UNSIGNED NOT NULL,
  `dept_id` int UNSIGNED NOT NULL,
  `topic_id` int UNSIGNED NOT NULL,
  `data` varchar(1024) DEFAULT NULL COMMENT 'Encoded differences',
  `username` varchar(128) NOT NULL DEFAULT 'SYSTEM',
  `uid` int UNSIGNED DEFAULT NULL,
  `uid_type` char(1) NOT NULL DEFAULT 'S',
  `annulled` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_thread_event`
--

INSERT INTO `ost_thread_event` (`id`, `thread_id`, `thread_type`, `event_id`, `staff_id`, `team_id`, `dept_id`, `topic_id`, `data`, `username`, `uid`, `uid_type`, `annulled`, `timestamp`) VALUES
(1, 1, 'T', 1, 0, 0, 1, 1, NULL, 'SYSTEM', 1, 'U', 0, '2023-12-15 19:45:06');

-- --------------------------------------------------------

--
-- Table structure for table `ost_thread_referral`
--

CREATE TABLE `ost_thread_referral` (
  `id` int UNSIGNED NOT NULL,
  `thread_id` int UNSIGNED NOT NULL,
  `object_id` int UNSIGNED NOT NULL,
  `object_type` char(1) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket`
--

CREATE TABLE `ost_ticket` (
  `ticket_id` int UNSIGNED NOT NULL,
  `ticket_pid` int UNSIGNED DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `user_email_id` int UNSIGNED NOT NULL DEFAULT '0',
  `status_id` int UNSIGNED NOT NULL DEFAULT '0',
  `dept_id` int UNSIGNED NOT NULL DEFAULT '0',
  `sla_id` int UNSIGNED NOT NULL DEFAULT '0',
  `topic_id` int UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int UNSIGNED NOT NULL DEFAULT '0',
  `team_id` int UNSIGNED NOT NULL DEFAULT '0',
  `email_id` int UNSIGNED NOT NULL DEFAULT '0',
  `lock_id` int UNSIGNED NOT NULL DEFAULT '0',
  `flags` int UNSIGNED NOT NULL DEFAULT '0',
  `sort` int UNSIGNED NOT NULL DEFAULT '0',
  `ip_address` varchar(64) NOT NULL DEFAULT '',
  `source` enum('Web','Email','Phone','API','Other') NOT NULL DEFAULT 'Other',
  `source_extra` varchar(40) DEFAULT NULL,
  `isoverdue` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `isanswered` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `duedate` datetime DEFAULT NULL,
  `est_duedate` datetime DEFAULT NULL,
  `reopened` datetime DEFAULT NULL,
  `closed` datetime DEFAULT NULL,
  `lastupdate` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_ticket`
--

INSERT INTO `ost_ticket` (`ticket_id`, `ticket_pid`, `number`, `user_id`, `user_email_id`, `status_id`, `dept_id`, `sla_id`, `topic_id`, `staff_id`, `team_id`, `email_id`, `lock_id`, `flags`, `sort`, `ip_address`, `source`, `source_extra`, `isoverdue`, `isanswered`, `duedate`, `est_duedate`, `reopened`, `closed`, `lastupdate`, `created`, `updated`) VALUES
(1, NULL, '882490', 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '172.28.16.1', 'Web', NULL, 0, 0, NULL, '2023-12-20 08:00:00', NULL, NULL, '2023-12-15 19:45:06', '2023-12-15 19:45:05', '2023-12-15 19:45:07');

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket_priority`
--

CREATE TABLE `ost_ticket_priority` (
  `priority_id` tinyint NOT NULL,
  `priority` varchar(60) NOT NULL DEFAULT '',
  `priority_desc` varchar(30) NOT NULL DEFAULT '',
  `priority_color` varchar(7) NOT NULL DEFAULT '',
  `priority_urgency` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_ticket_priority`
--

INSERT INTO `ost_ticket_priority` (`priority_id`, `priority`, `priority_desc`, `priority_color`, `priority_urgency`, `ispublic`) VALUES
(1, 'low', 'Low', '#DDFFDD', 4, 1),
(2, 'normal', 'Normal', '#FFFFF0', 3, 1),
(3, 'high', 'High', '#FEE7E7', 2, 1),
(4, 'emergency', 'Emergency', '#FEE7E7', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket_status`
--

CREATE TABLE `ost_ticket_status` (
  `id` int NOT NULL,
  `name` varchar(60) NOT NULL DEFAULT '',
  `state` varchar(16) DEFAULT NULL,
  `mode` int UNSIGNED NOT NULL DEFAULT '0',
  `flags` int UNSIGNED NOT NULL DEFAULT '0',
  `sort` int UNSIGNED NOT NULL DEFAULT '0',
  `properties` text NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_ticket_status`
--

INSERT INTO `ost_ticket_status` (`id`, `name`, `state`, `mode`, `flags`, `sort`, `properties`, `created`, `updated`) VALUES
(1, 'Open', 'open', 3, 0, 1, '{\"description\":\"Open tickets.\"}', '2023-12-15 19:44:35', '0000-00-00 00:00:00'),
(2, 'Resolved', 'closed', 1, 0, 2, '{\"allowreopen\":true,\"reopenstatus\":0,\"description\":\"Resolved tickets\"}', '2023-12-15 19:44:35', '0000-00-00 00:00:00'),
(3, 'Closed', 'closed', 3, 0, 3, '{\"allowreopen\":true,\"reopenstatus\":0,\"description\":\"Closed tickets. Tickets will still be accessible on client and staff panels.\"}', '2023-12-15 19:44:35', '0000-00-00 00:00:00'),
(4, 'Archived', 'archived', 3, 0, 4, '{\"description\":\"Tickets only adminstratively available but no longer accessible on ticket queues and client panel.\"}', '2023-12-15 19:44:35', '0000-00-00 00:00:00'),
(5, 'Deleted', 'deleted', 3, 0, 5, '{\"description\":\"Tickets queued for deletion. Not accessible on ticket queues.\"}', '2023-12-15 19:44:35', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket__cdata`
--

CREATE TABLE `ost_ticket__cdata` (
  `ticket_id` int UNSIGNED NOT NULL,
  `subject` mediumtext,
  `priority` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_ticket__cdata`
--

INSERT INTO `ost_ticket__cdata` (`ticket_id`, `subject`, `priority`) VALUES
(1, 'osTicket Installed!', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ost_translation`
--

CREATE TABLE `ost_translation` (
  `id` int UNSIGNED NOT NULL,
  `object_hash` char(16) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `type` enum('phrase','article','override') DEFAULT NULL,
  `flags` int UNSIGNED NOT NULL DEFAULT '0',
  `revision` int UNSIGNED DEFAULT NULL,
  `agent_id` int UNSIGNED NOT NULL DEFAULT '0',
  `lang` varchar(16) NOT NULL DEFAULT '',
  `text` mediumtext NOT NULL,
  `source_text` text,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_user`
--

CREATE TABLE `ost_user` (
  `id` int UNSIGNED NOT NULL,
  `org_id` int UNSIGNED NOT NULL,
  `default_email_id` int NOT NULL,
  `status` int UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_user`
--

INSERT INTO `ost_user` (`id`, `org_id`, `default_email_id`, `status`, `name`, `created`, `updated`) VALUES
(1, 1, 1, 0, 'osTicket Team', '2023-12-15 19:45:05', '2023-12-15 19:45:07');

-- --------------------------------------------------------

--
-- Table structure for table `ost_user_account`
--

CREATE TABLE `ost_user_account` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `status` int UNSIGNED NOT NULL DEFAULT '0',
  `timezone` varchar(64) DEFAULT NULL,
  `lang` varchar(16) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `passwd` varchar(128) CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,
  `backend` varchar(32) DEFAULT NULL,
  `extra` text,
  `registered` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_user_email`
--

CREATE TABLE `ost_user_email` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `flags` int UNSIGNED NOT NULL DEFAULT '0',
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_user_email`
--

INSERT INTO `ost_user_email` (`id`, `user_id`, `flags`, `address`) VALUES
(1, 1, 0, 'feedback@osticket.com');

-- --------------------------------------------------------

--
-- Table structure for table `ost_user__cdata`
--

CREATE TABLE `ost_user__cdata` (
  `user_id` int UNSIGNED NOT NULL,
  `email` mediumtext,
  `name` mediumtext,
  `phone` mediumtext,
  `notes` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost__search`
--

CREATE TABLE `ost__search` (
  `object_type` varchar(8) NOT NULL,
  `object_id` int UNSIGNED NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost__search`
--

INSERT INTO `ost__search` (`object_type`, `object_id`, `title`, `content`) VALUES
('H', 1, 'osTicket Installed!', 'Thank you for choosing osTicket. Please make sure you join the osTicket forums and our mailing list to stay up to date on the latest news, security alerts and updates. The osTicket forums are also a great place to get assistance, guidance, tips, and help from other osTicket users. In addition to the forums, the osTicket Docs provides a useful collection of educational materials, documentation, and notes from the community. We welcome your contributions to the osTicket community. If you are looking for a greater level of support, we provide professional services and commercial support with guaranteed response times, and access to the core development team. We can also help customize osTicket or even add new features to the system to meet your unique needs. If the idea of managing and upgrading this osTicket installation is daunting, you can try osTicket as a hosted service at https://supportsystem.com/ -- no installation required and we can import your data! With SupportSystem\'s turnkey infrastructure, you get osTicket at its best, leaving you free to focus on your customers without the burden of making sure the application is stable, maintained, and secure. Cheers, - osTicket Team - https://osticket.com/ PS. Don\'t just make customers happy, make happy customers!'),
('O', 1, 'osTicket', ''),
('T', 1, '882490 osTicket Installed!', ''),
('U', 1, 'osTicket Team', 'feedback@osticket.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ost_api_key`
--
ALTER TABLE `ost_api_key`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `apikey` (`apikey`),
  ADD KEY `ipaddr` (`ipaddr`);

--
-- Indexes for table `ost_attachment`
--
ALTER TABLE `ost_attachment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `file-type` (`object_id`,`file_id`,`type`),
  ADD UNIQUE KEY `file_object` (`file_id`,`object_id`);

--
-- Indexes for table `ost_canned_response`
--
ALTER TABLE `ost_canned_response`
  ADD PRIMARY KEY (`canned_id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `active` (`isenabled`);

--
-- Indexes for table `ost_config`
--
ALTER TABLE `ost_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `namespace` (`namespace`,`key`);

--
-- Indexes for table `ost_content`
--
ALTER TABLE `ost_content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ost_department`
--
ALTER TABLE `ost_department`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`pid`),
  ADD KEY `manager_id` (`manager_id`),
  ADD KEY `autoresp_email_id` (`autoresp_email_id`),
  ADD KEY `tpl_id` (`tpl_id`),
  ADD KEY `flags` (`flags`);

--
-- Indexes for table `ost_draft`
--
ALTER TABLE `ost_draft`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `namespace` (`namespace`);

--
-- Indexes for table `ost_email`
--
ALTER TABLE `ost_email`
  ADD PRIMARY KEY (`email_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `priority_id` (`priority_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `ost_email_account`
--
ALTER TABLE `ost_email_account`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_id` (`email_id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `ost_email_template`
--
ALTER TABLE `ost_email_template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `template_lookup` (`tpl_id`,`code_name`);

--
-- Indexes for table `ost_email_template_group`
--
ALTER TABLE `ost_email_template_group`
  ADD PRIMARY KEY (`tpl_id`);

--
-- Indexes for table `ost_event`
--
ALTER TABLE `ost_event`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ost_faq`
--
ALTER TABLE `ost_faq`
  ADD PRIMARY KEY (`faq_id`),
  ADD UNIQUE KEY `question` (`question`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `ispublished` (`ispublished`);

--
-- Indexes for table `ost_faq_category`
--
ALTER TABLE `ost_faq_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `ispublic` (`ispublic`);

--
-- Indexes for table `ost_faq_topic`
--
ALTER TABLE `ost_faq_topic`
  ADD PRIMARY KEY (`faq_id`,`topic_id`);

--
-- Indexes for table `ost_file`
--
ALTER TABLE `ost_file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ft` (`ft`),
  ADD KEY `key` (`key`),
  ADD KEY `signature` (`signature`),
  ADD KEY `type` (`type`),
  ADD KEY `created` (`created`),
  ADD KEY `size` (`size`);

--
-- Indexes for table `ost_file_chunk`
--
ALTER TABLE `ost_file_chunk`
  ADD PRIMARY KEY (`file_id`,`chunk_id`);

--
-- Indexes for table `ost_filter`
--
ALTER TABLE `ost_filter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `email_id` (`email_id`);

--
-- Indexes for table `ost_filter_action`
--
ALTER TABLE `ost_filter_action`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filter_id` (`filter_id`);

--
-- Indexes for table `ost_filter_rule`
--
ALTER TABLE `ost_filter_rule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `filter` (`filter_id`,`what`,`how`,`val`),
  ADD KEY `filter_id` (`filter_id`);

--
-- Indexes for table `ost_form`
--
ALTER TABLE `ost_form`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `ost_form_entry`
--
ALTER TABLE `ost_form_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_lookup` (`object_type`,`object_id`);

--
-- Indexes for table `ost_form_entry_values`
--
ALTER TABLE `ost_form_entry_values`
  ADD PRIMARY KEY (`entry_id`,`field_id`);

--
-- Indexes for table `ost_form_field`
--
ALTER TABLE `ost_form_field`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_id` (`form_id`),
  ADD KEY `sort` (`sort`);

--
-- Indexes for table `ost_group`
--
ALTER TABLE `ost_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `ost_help_topic`
--
ALTER TABLE `ost_help_topic`
  ADD PRIMARY KEY (`topic_id`),
  ADD UNIQUE KEY `topic` (`topic`,`topic_pid`),
  ADD KEY `topic_pid` (`topic_pid`),
  ADD KEY `priority_id` (`priority_id`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `staff_id` (`staff_id`,`team_id`),
  ADD KEY `sla_id` (`sla_id`),
  ADD KEY `page_id` (`page_id`);

--
-- Indexes for table `ost_help_topic_form`
--
ALTER TABLE `ost_help_topic_form`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topic-form` (`topic_id`,`form_id`);

--
-- Indexes for table `ost_inventory_asset`
--
ALTER TABLE `ost_inventory_asset`
  ADD PRIMARY KEY (`asset_id`);

--
-- Indexes for table `ost_inventory__cdata`
--
ALTER TABLE `ost_inventory__cdata`
  ADD PRIMARY KEY (`asset_id`);

--
-- Indexes for table `ost_list`
--
ALTER TABLE `ost_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `ost_list_items`
--
ALTER TABLE `ost_list_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `list_item_lookup` (`list_id`);

--
-- Indexes for table `ost_lock`
--
ALTER TABLE `ost_lock`
  ADD PRIMARY KEY (`lock_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `ost_note`
--
ALTER TABLE `ost_note`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ext_id` (`ext_id`);

--
-- Indexes for table `ost_organization`
--
ALTER TABLE `ost_organization`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ost_organization__cdata`
--
ALTER TABLE `ost_organization__cdata`
  ADD PRIMARY KEY (`org_id`);

--
-- Indexes for table `ost_plugin`
--
ALTER TABLE `ost_plugin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `install_path` (`install_path`);

--
-- Indexes for table `ost_plugin_instance`
--
ALTER TABLE `ost_plugin_instance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plugin_id` (`plugin_id`);

--
-- Indexes for table `ost_queue`
--
ALTER TABLE `ost_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `ost_queue_column`
--
ALTER TABLE `ost_queue_column`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ost_queue_columns`
--
ALTER TABLE `ost_queue_columns`
  ADD PRIMARY KEY (`queue_id`,`column_id`,`staff_id`);

--
-- Indexes for table `ost_queue_config`
--
ALTER TABLE `ost_queue_config`
  ADD PRIMARY KEY (`queue_id`,`staff_id`);

--
-- Indexes for table `ost_queue_export`
--
ALTER TABLE `ost_queue_export`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue_id` (`queue_id`);

--
-- Indexes for table `ost_queue_sort`
--
ALTER TABLE `ost_queue_sort`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ost_queue_sorts`
--
ALTER TABLE `ost_queue_sorts`
  ADD PRIMARY KEY (`queue_id`,`sort_id`);

--
-- Indexes for table `ost_role`
--
ALTER TABLE `ost_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ost_schedule`
--
ALTER TABLE `ost_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ost_schedule_entry`
--
ALTER TABLE `ost_schedule_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedule_id` (`schedule_id`),
  ADD KEY `repeats` (`repeats`);

--
-- Indexes for table `ost_sequence`
--
ALTER TABLE `ost_sequence`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ost_session`
--
ALTER TABLE `ost_session`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `updated` (`session_updated`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ost_sla`
--
ALTER TABLE `ost_sla`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ost_staff`
--
ALTER TABLE `ost_staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `issuperuser` (`isadmin`),
  ADD KEY `isactive` (`isactive`),
  ADD KEY `onvacation` (`onvacation`);

--
-- Indexes for table `ost_staff_dept_access`
--
ALTER TABLE `ost_staff_dept_access`
  ADD PRIMARY KEY (`staff_id`,`dept_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `ost_syslog`
--
ALTER TABLE `ost_syslog`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `log_type` (`log_type`);

--
-- Indexes for table `ost_task`
--
ALTER TABLE `ost_task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `created` (`created`),
  ADD KEY `object` (`object_id`,`object_type`),
  ADD KEY `flags` (`flags`);

--
-- Indexes for table `ost_task__cdata`
--
ALTER TABLE `ost_task__cdata`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `ost_team`
--
ALTER TABLE `ost_team`
  ADD PRIMARY KEY (`team_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `lead_id` (`lead_id`);

--
-- Indexes for table `ost_team_member`
--
ALTER TABLE `ost_team_member`
  ADD PRIMARY KEY (`team_id`,`staff_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `ost_thread`
--
ALTER TABLE `ost_thread`
  ADD PRIMARY KEY (`id`),
  ADD KEY `object_id` (`object_id`),
  ADD KEY `object_type` (`object_type`);

--
-- Indexes for table `ost_thread_collaborator`
--
ALTER TABLE `ost_thread_collaborator`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `collab` (`thread_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ost_thread_entry`
--
ALTER TABLE `ost_thread_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `thread_id` (`thread_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `ost_thread_entry_email`
--
ALTER TABLE `ost_thread_entry_email`
  ADD PRIMARY KEY (`id`),
  ADD KEY `thread_entry_id` (`thread_entry_id`),
  ADD KEY `mid` (`mid`),
  ADD KEY `email_id` (`email_id`);

--
-- Indexes for table `ost_thread_entry_merge`
--
ALTER TABLE `ost_thread_entry_merge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `thread_entry_id` (`thread_entry_id`);

--
-- Indexes for table `ost_thread_event`
--
ALTER TABLE `ost_thread_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_state` (`thread_id`,`event_id`,`timestamp`),
  ADD KEY `ticket_stats` (`timestamp`,`event_id`);

--
-- Indexes for table `ost_thread_referral`
--
ALTER TABLE `ost_thread_referral`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ref` (`object_id`,`object_type`,`thread_id`),
  ADD KEY `thread_id` (`thread_id`);

--
-- Indexes for table `ost_ticket`
--
ALTER TABLE `ost_ticket`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `created` (`created`),
  ADD KEY `closed` (`closed`),
  ADD KEY `duedate` (`duedate`),
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `sla_id` (`sla_id`),
  ADD KEY `ticket_pid` (`ticket_pid`);

--
-- Indexes for table `ost_ticket_priority`
--
ALTER TABLE `ost_ticket_priority`
  ADD PRIMARY KEY (`priority_id`),
  ADD UNIQUE KEY `priority` (`priority`),
  ADD KEY `priority_urgency` (`priority_urgency`),
  ADD KEY `ispublic` (`ispublic`);

--
-- Indexes for table `ost_ticket_status`
--
ALTER TABLE `ost_ticket_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `state` (`state`);

--
-- Indexes for table `ost_ticket__cdata`
--
ALTER TABLE `ost_ticket__cdata`
  ADD PRIMARY KEY (`ticket_id`);

--
-- Indexes for table `ost_translation`
--
ALTER TABLE `ost_translation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`,`lang`),
  ADD KEY `object_hash` (`object_hash`);

--
-- Indexes for table `ost_user`
--
ALTER TABLE `ost_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `org_id` (`org_id`),
  ADD KEY `default_email_id` (`default_email_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `ost_user_account`
--
ALTER TABLE `ost_user_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ost_user_email`
--
ALTER TABLE `ost_user_email`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `address` (`address`),
  ADD KEY `user_email_lookup` (`user_id`);

--
-- Indexes for table `ost_user__cdata`
--
ALTER TABLE `ost_user__cdata`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `ost__search`
--
ALTER TABLE `ost__search`
  ADD PRIMARY KEY (`object_type`,`object_id`);
ALTER TABLE `ost__search` ADD FULLTEXT KEY `search` (`title`,`content`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ost_api_key`
--
ALTER TABLE `ost_api_key`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_attachment`
--
ALTER TABLE `ost_attachment`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ost_canned_response`
--
ALTER TABLE `ost_canned_response`
  MODIFY `canned_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ost_config`
--
ALTER TABLE `ost_config`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `ost_content`
--
ALTER TABLE `ost_content`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `ost_department`
--
ALTER TABLE `ost_department`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ost_draft`
--
ALTER TABLE `ost_draft`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_email`
--
ALTER TABLE `ost_email`
  MODIFY `email_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ost_email_account`
--
ALTER TABLE `ost_email_account`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_email_template`
--
ALTER TABLE `ost_email_template`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `ost_email_template_group`
--
ALTER TABLE `ost_email_template_group`
  MODIFY `tpl_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ost_event`
--
ALTER TABLE `ost_event`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `ost_faq`
--
ALTER TABLE `ost_faq`
  MODIFY `faq_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_faq_category`
--
ALTER TABLE `ost_faq_category`
  MODIFY `category_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_file`
--
ALTER TABLE `ost_file`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ost_filter`
--
ALTER TABLE `ost_filter`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ost_filter_action`
--
ALTER TABLE `ost_filter_action`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ost_filter_rule`
--
ALTER TABLE `ost_filter_rule`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ost_form`
--
ALTER TABLE `ost_form`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ost_form_entry`
--
ALTER TABLE `ost_form_entry`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ost_form_field`
--
ALTER TABLE `ost_form_field`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `ost_group`
--
ALTER TABLE `ost_group`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_help_topic`
--
ALTER TABLE `ost_help_topic`
  MODIFY `topic_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ost_help_topic_form`
--
ALTER TABLE `ost_help_topic_form`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ost_inventory_asset`
--
ALTER TABLE `ost_inventory_asset`
  MODIFY `asset_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ost_list`
--
ALTER TABLE `ost_list`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ost_list_items`
--
ALTER TABLE `ost_list_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_lock`
--
ALTER TABLE `ost_lock`
  MODIFY `lock_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_note`
--
ALTER TABLE `ost_note`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_organization`
--
ALTER TABLE `ost_organization`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ost_plugin`
--
ALTER TABLE `ost_plugin`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ost_plugin_instance`
--
ALTER TABLE `ost_plugin_instance`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ost_queue`
--
ALTER TABLE `ost_queue`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `ost_queue_column`
--
ALTER TABLE `ost_queue_column`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `ost_queue_export`
--
ALTER TABLE `ost_queue_export`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_queue_sort`
--
ALTER TABLE `ost_queue_sort`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ost_role`
--
ALTER TABLE `ost_role`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ost_schedule`
--
ALTER TABLE `ost_schedule`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ost_schedule_entry`
--
ALTER TABLE `ost_schedule_entry`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `ost_sequence`
--
ALTER TABLE `ost_sequence`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ost_sla`
--
ALTER TABLE `ost_sla`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ost_staff`
--
ALTER TABLE `ost_staff`
  MODIFY `staff_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ost_syslog`
--
ALTER TABLE `ost_syslog`
  MODIFY `log_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ost_task`
--
ALTER TABLE `ost_task`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_team`
--
ALTER TABLE `ost_team`
  MODIFY `team_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ost_thread`
--
ALTER TABLE `ost_thread`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ost_thread_collaborator`
--
ALTER TABLE `ost_thread_collaborator`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_thread_entry`
--
ALTER TABLE `ost_thread_entry`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ost_thread_entry_email`
--
ALTER TABLE `ost_thread_entry_email`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_thread_entry_merge`
--
ALTER TABLE `ost_thread_entry_merge`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_thread_event`
--
ALTER TABLE `ost_thread_event`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ost_thread_referral`
--
ALTER TABLE `ost_thread_referral`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_ticket`
--
ALTER TABLE `ost_ticket`
  MODIFY `ticket_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ost_ticket_priority`
--
ALTER TABLE `ost_ticket_priority`
  MODIFY `priority_id` tinyint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ost_ticket_status`
--
ALTER TABLE `ost_ticket_status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ost_translation`
--
ALTER TABLE `ost_translation`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_user`
--
ALTER TABLE `ost_user`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ost_user_account`
--
ALTER TABLE `ost_user_account`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ost_user_email`
--
ALTER TABLE `ost_user_email`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
