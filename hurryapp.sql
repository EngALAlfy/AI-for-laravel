--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`name`)),
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assist_drivers`
--

CREATE TABLE `assist_drivers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_arrived` tinyint(1) NOT NULL DEFAULT 0,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `driver_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audience_coupon_user`
--

CREATE TABLE `audience_coupon_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `balances`
--

CREATE TABLE `balances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `balance` decimal(10,2) DEFAULT 0.00,
  `spent` decimal(10,2) DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `suspended_at` datetime DEFAULT NULL,
  `suspended_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `balance_transactions`
--

CREATE TABLE `balance_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `balance_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `depit` decimal(10,2) DEFAULT 0.00,
  `credit` decimal(10,2) DEFAULT 0.00,
  `balance` decimal(10,2) DEFAULT 0.00,
  `statement` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_id` bigint(20) UNSIGNED DEFAULT NULL,
  `receiver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `processing` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`name`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `number_of_persons` tinyint(3) UNSIGNED NOT NULL,
  `place` tinyint(1) DEFAULT 0,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `app_amount` decimal(10,2) DEFAULT 0.00,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancellation_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `icame` tinyint(1) DEFAULT NULL,
  `rating` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `bookings_earnings_per_day`
-- (See below for the actual view)
--
CREATE TABLE `bookings_earnings_per_day` (
`booking_id` bigint(20) unsigned
,`branch_id` bigint(20) unsigned
,`restaurant_id` bigint(20) unsigned
,`day` date
,`status_id` bigint(20) unsigned
,`total` decimal(32,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `booking_inactive_times`
--

CREATE TABLE `booking_inactive_times` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `time` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking_status`
--

CREATE TABLE `booking_status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`status`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks`
--

CREATE TABLE `bookmarks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `bookmark_type` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bookmark_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`name`)),
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`description`)),
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`address`)),
  `latitude` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_status_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_rush_delay` int(11) NOT NULL DEFAULT 0,
  `active` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_central` tinyint(1) NOT NULL DEFAULT 0,
  `restaurant_inactive_reason_id` bigint(20) UNSIGNED DEFAULT NULL,
  `inactive_note` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branch_rush_days`
--

CREATE TABLE `branch_rush_days` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branch_sessions`
--

CREATE TABLE `branch_sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `day` date DEFAULT NULL,
  `start_at` timestamp NULL DEFAULT NULL,
  `end_at` timestamp NULL DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED NOT NULL,
  `force` tinyint(1) NOT NULL DEFAULT 0,
  `status_reason_id` bigint(20) UNSIGNED DEFAULT NULL,
  `by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branch_statistics`
--

CREATE TABLE `branch_statistics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `avg_online` double NOT NULL DEFAULT 0,
  `avg_busy` double NOT NULL DEFAULT 0,
  `avg_offline` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `branch_statistics_per_day`
-- (See below for the actual view)
--
CREATE TABLE `branch_statistics_per_day` (
`branch_id` bigint(20) unsigned
,`restaurant_id` bigint(20) unsigned
,`day` date
,`status_id` bigint(20) unsigned
,`avg_time` decimal(42,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `camera_requests`
--

CREATE TABLE `camera_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `driver_id` bigint(20) UNSIGNED NOT NULL,
  `day` date DEFAULT NULL,
  `driver_captured_image_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `should_fire_alarm` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cancellation_reasons`
--

CREATE TABLE `cancellation_reasons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`name`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restaurant_cost_percentage` int(11) DEFAULT 0,
  `app_cost_percentage` int(11) DEFAULT 0,
  `has_note` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cancellation_reason_role`
--

CREATE TABLE `cancellation_reason_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cancellation_reason_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `captain_providers`
--

CREATE TABLE `captain_providers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `office_address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `captain_provider_zones`
--

CREATE TABLE `captain_provider_zones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `captain_provider_id` bigint(20) UNSIGNED NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `career_faqs`
--

CREATE TABLE `career_faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`title`)),
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (`content` is null or json_valid(`content`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `career_positions`
--

CREATE TABLE `career_positions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`title`)),
  `subtitle` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (`subtitle` is null or json_valid(`subtitle`)),
  `form_link` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `career_sliders`
--

CREATE TABLE `career_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`title`)),
  `subtitle` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (`subtitle` is null or json_valid(`subtitle`)),
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (`description` is null or json_valid(`description`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `career_teams`
--

CREATE TABLE `career_teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`title`)),
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (`description` is null or json_valid(`description`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `career_videos`
--

CREATE TABLE `career_videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `video_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (`description` is null or json_valid(`description`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_foods`
--

CREATE TABLE `cart_foods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `food_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `size_id` bigint(20) UNSIGNED DEFAULT NULL,
  `extras` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (`extras` is null or json_valid(`extras`)),
  `preferences` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (`preferences` is null or json_valid(`preferences`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`name`)),
  `sort` int(11) NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`description`)),
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `cuisine_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `sector_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`name`)),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clubs`
--

CREATE TABLE `clubs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `join_at` date DEFAULT NULL,
  `expires_at` date DEFAULT NULL,
  `expired_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `collection_banners`
--

CREATE TABLE `collection_banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`name`)),
  `is_items` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `collection_banner_items`
--

CREATE TABLE `collection_banner_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `collection_banner_id` bigint(20) UNSIGNED NOT NULL,
  `target_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `compensation`
--

CREATE TABLE `compensation` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`name`)),
  `value` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `compensation_conditions`
--

CREATE TABLE `compensation_conditions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `limit` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `compensation_role`
--

CREATE TABLE `compensation_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `compensation_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agent_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) DEFAULT NULL,
  `restaurant_id` bigint(20) DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `submission_date` datetime NOT NULL,
  `close_date` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complaint_actions`
--

CREATE TABLE `complaint_actions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `complaint_id` bigint(20) UNSIGNED NOT NULL,
  `agent_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `constrained_order_confirmation`
--

CREATE TABLE `constrained_order_confirmation` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `level` tinyint(4) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `paid_online` tinyint(1) DEFAULT NULL,
  `trusted` tinyint(1) DEFAULT NULL,
  `deposit_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit_accepted_at` datetime DEFAULT NULL,
  `deposit_received` decimal(8,2) DEFAULT NULL,
  `deposit_percentage` int(11) DEFAULT NULL,
  `deposit_value` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_person`
--

CREATE TABLE `contact_person` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `conversationable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversationable_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `discount_max` decimal(10,2) DEFAULT NULL,
  `coupon_condition` decimal(10,2) DEFAULT 0.00,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`description`)),
  `expires_at` datetime DEFAULT NULL,
  `starts_at` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `showable` tinyint(1) NOT NULL DEFAULT 0,
  `club` tinyint(1) NOT NULL DEFAULT 0,
  `audience` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_groups` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (`zone_groups` is null or json_valid(`zone_groups`)),
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `app_coupon` tinyint(1) NOT NULL DEFAULT 1,
  `campaign` tinyint(1) NOT NULL DEFAULT 0,
  `multiple_use` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `max_users` int(11) DEFAULT 0,
  `archived_at` datetime DEFAULT NULL,
  `first_order` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_campaign_targets`
--

CREATE TABLE `coupon_campaign_targets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_requests`
--

CREATE TABLE `coupon_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `discount_max` decimal(10,2) DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (`description` is null or json_valid(`description`)),
  `expires_at` datetime DEFAULT NULL,
  `starts_at` datetime DEFAULT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `foods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (`foods` is null or json_valid(`foods`)),
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `coupon_condition` decimal(10,2) DEFAULT 0.00,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `approved_by_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `showable` tinyint(1) NOT NULL DEFAULT 0,
  `club` tinyint(1) NOT NULL DEFAULT 0,
  `audience` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_groups` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (`zone_groups` is null or json_valid(`zone_groups`)),
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `max_users` int(11) DEFAULT 0,
  `multiple_use` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_times`
--

CREATE TABLE `coupon_times` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `day` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from` time DEFAULT NULL,
  `to` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cuisines`
--

CREATE TABLE `cuisines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`name`)),
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`description`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_digits` tinyint(3) UNSIGNED DEFAULT NULL,
  `rounding` tinyint(3) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deep_link_short_codes`
--

CREATE TABLE `deep_link_short_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `short_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (`meta` is null or json_valid(`meta`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_addresses`
--

CREATE TABLE `delivery_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `building` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `floor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apartment` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_vehicles`
--

CREATE TABLE `delivery_vehicles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`name`)),
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discountables`
--

CREATE TABLE `discountables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `discountable_type` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discountable_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dispatching`
--

CREATE TABLE `dispatching` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_received` tinyint(1) NOT NULL DEFAULT 0,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `driver_id` bigint(20) UNSIGNED NOT NULL,
  `received_from_driver_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `age` int(11) DEFAULT NULL,
  `address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `available` tinyint(1) NOT NULL DEFAULT 0,
  `condition` enum('active','inactive','suspended','terminated') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `condition_note` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `national_id_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `wallet_number` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `national_id_expiration` date DEFAULT NULL,
  `driving_license_number` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `driving_license_expiration` date DEFAULT NULL,
  `delivery_vehicle_id` bigint(20) UNSIGNED NOT NULL,
  `plate_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `captain_provider_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drivers_fee`
--

CREATE TABLE `drivers_fee` (
  `id` int(11) NOT NULL,
  `fee_percentage` int(11) NOT NULL,
  `fee_fixed` int(11) NOT NULL,
  `ragion` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drivers_payouts`
--

CREATE TABLE `drivers_payouts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `driver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `accounting_date` date DEFAULT NULL,
  `method` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `doc_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `driver_arrivals`
--

CREATE TABLE `driver_arrivals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `driver_id` bigint(20) UNSIGNED NOT NULL,
  `client_arrival` datetime DEFAULT NULL,
  `store_arrival` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `driver_assist_earnings_per_day`
-- (See below for the actual view)
--
CREATE TABLE `driver_assist_earnings_per_day` (
`driver_id` bigint(20) unsigned
,`day` date
,`order_id` bigint(20) unsigned
,`status_id` bigint(20) unsigned
,`captain` decimal(10,2)
,`order_delivery` decimal(10,2)
,`payment_status` enum('pending','captured','declined','refunded')
,`payment_method` enum('cash','credit_card','vodafone_cash','my_balance','pickup','hybrid','employee_wallet')
);

-- --------------------------------------------------------

--
-- Table structure for table `driver_captured_images`
--

CREATE TABLE `driver_captured_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `driver_id` bigint(20) UNSIGNED NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mac_address` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version_number` int(11) DEFAULT NULL,
  `lag` double DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `session_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `driver_cash_requests`
--

CREATE TABLE `driver_cash_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `driver_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_by_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `driver_day_offs`
--

CREATE TABLE `driver_day_offs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `day_of_week` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `driver_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `driver_earnings_per_day`
-- (See below for the actual view)
--
CREATE TABLE `driver_earnings_per_day` (
`driver_id` bigint(20) unsigned
,`day` date
,`order_id` bigint(20) unsigned
,`status_id` bigint(20) unsigned
,`captain` decimal(10,2)
,`order_delivery` decimal(10,2)
,`payment_total` decimal(32,2)
,`payment_status` enum('pending','captured','declined','refunded')
,`payment_method` enum('cash','credit_card','vodafone_cash','my_balance','pickup','hybrid','employee_wallet')
,`captain_get` decimal(33,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `driver_finished_orders_per_day`
-- (See below for the actual view)
--
CREATE TABLE `driver_finished_orders_per_day` (
`driver_id` bigint(20) unsigned
,`day` date
,`order_count` bigint(21)
,`accepttime` decimal(42,0)
,`deliverytime` decimal(42,0)
,`speed` decimal(40,6)
);

-- --------------------------------------------------------

--
-- Table structure for table `driver_live_location_histories`
--

CREATE TABLE `driver_live_location_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `driver_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `driver_id` bigint(20) UNSIGNED NOT NULL,
  `user_status_id` bigint(20) UNSIGNED NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `orders` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (`orders` is null or json_valid(`orders`)),
  `time` time NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `driver_lost_work_time_per_day`
-- (See below for the actual view)
--
CREATE TABLE `driver_lost_work_time_per_day` (
`driver_id` bigint(20) unsigned
,`day` date
,`duration_in_seconds` decimal(42,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `driver_order_notification`
--

CREATE TABLE `driver_order_notification` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `driver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `late_time` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `driver_penalties`
--

CREATE TABLE `driver_penalties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `week_start` date NOT NULL,
  `driver_id` bigint(20) UNSIGNED NOT NULL,
  `created_by_user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `driver_rate`
-- (See below for the actual view)
--
CREATE TABLE `driver_rate` (
`driver_id` bigint(20) unsigned
,`rate` decimal(7,4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `driver_real_work_time_per_day`
-- (See below for the actual view)
--
CREATE TABLE `driver_real_work_time_per_day` (
`driver_id` bigint(20) unsigned
,`day` date
,`duration_in_seconds` decimal(42,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `driver_requests`
--

CREATE TABLE `driver_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `captain_provider_id` bigint(20) UNSIGNED DEFAULT NULL,
  `address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number_alt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `preferred_work_time` enum('MORNING','AFTERNOON','EVENING') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Under Revision',
  `viewed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `wallet_number` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_vehicle_id` bigint(20) UNSIGNED DEFAULT NULL,
  `plate_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `driver_reviews`
--

CREATE TABLE `driver_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT 0,
  `driver_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `driver_sessions`
--

CREATE TABLE `driver_sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `driver_id` bigint(20) UNSIGNED NOT NULL,
  `day` date DEFAULT NULL,
  `start_at` timestamp NULL DEFAULT NULL,
  `end_at` timestamp NULL DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED NOT NULL,
  `shift` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mac_address` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version_number` int(11) DEFAULT NULL,
  `lag` double DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (`options` is null or json_valid(`options`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `driver_shifts`
--

CREATE TABLE `driver_shifts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `driver_shift_user`
--

CREATE TABLE `driver_shift_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `driver_id` bigint(20) UNSIGNED NOT NULL,
  `driver_shift_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `driver_statistics`
--

CREATE TABLE `driver_statistics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `driver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_orders` bigint(20) NOT NULL DEFAULT 0,
  `m_worked_days` int(11) NOT NULL DEFAULT 0,
  `m_worked_hours` decimal(10,2) NOT NULL DEFAULT 0.00,
  `worked_days` int(11) NOT NULL DEFAULT 0,
  `worked_hours` decimal(10,2) NOT NULL DEFAULT 0.00,
  `real_time_work` decimal(10,2) NOT NULL DEFAULT 0.00,
  `lost_time` decimal(10,2) NOT NULL DEFAULT 0.00,
  `response_time` decimal(10,2) NOT NULL DEFAULT 0.00,
  `overall_distance` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `driver_worked_hours_per_day`
-- (See below for the actual view)
--
CREATE TABLE `driver_worked_hours_per_day` (
`driver_id` bigint(20) unsigned
,`day` date
,`duration_in_seconds` decimal(42,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `driver_zones`
--

CREATE TABLE `driver_zones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `driver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_verify_tokens`
--

CREATE TABLE `email_verify_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `token` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_wallets`
--

CREATE TABLE `employee_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL,
  `auto_charge` tinyint(1) NOT NULL,
  `auto_charge_value` decimal(8,2) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_wallet_transactions`
--

CREATE TABLE `employee_wallet_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `auto_charge` tinyint(1) NOT NULL,
  `statement` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`statement`)),
  `employee_wallet_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `empty_extras_branches`
--

CREATE TABLE `empty_extras_branches` (
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `extra_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `empty_preferences_branches`
--

CREATE TABLE `empty_preferences_branches` (
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `preference_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `empty_sizes_branches`
--

CREATE TABLE `empty_sizes_branches` (
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `size_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `empty_stock_branches`
--

CREATE TABLE `empty_stock_branches` (
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `food_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `evaluations`
--

CREATE TABLE `evaluations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `driver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `restaurant_employee_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `restaurant_employee_job` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `restaurant_employee_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `training_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_of_violation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `explore_menu`
--

CREATE TABLE `explore_menu` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `sector_id` bigint(20) UNSIGNED DEFAULT NULL,
  `from` time DEFAULT NULL,
  `to` time DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `extras`
--

CREATE TABLE `extras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`name`)),
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`description`)),
  `price` decimal(10,2) DEFAULT 0.00,
  `extra_group_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `extra_food`
--

CREATE TABLE `extra_food` (
  `food_id` bigint(20) UNSIGNED NOT NULL,
  `extra_id` bigint(20) UNSIGNED NOT NULL,
  `active` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `extra_groups`
--

CREATE TABLE `extra_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`name`)),
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`description`)),
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `force` tinyint(1) NOT NULL DEFAULT 0,
  `max` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `extra_size`
--

CREATE TABLE `extra_size` (
  `extra_id` bigint(20) UNSIGNED NOT NULL,
  `size_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`question`)),
  `answer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`answer`)),
  `faq_category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq_categories`
--

CREATE TABLE `faq_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`name`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq_roles`
--

CREATE TABLE `faq_roles` (
  `faq_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `food_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorite_extras`
--

CREATE TABLE `favorite_extras` (
  `extra_id` bigint(20) UNSIGNED NOT NULL,
  `favorite_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `first_time_passwords`
--

CREATE TABLE `first_time_passwords` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `token` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE `foods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`name`)),
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount_price` decimal(10,2) DEFAULT 0.00,
  `app_discount_price` decimal(10,2) DEFAULT NULL,
  `store_discount_price` decimal(10,2) DEFAULT NULL,
  `preparing_time` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`description`)),
  `ingredients` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`ingredients`)),
  `package_items_count` int(11) DEFAULT 0,
  `weight` decimal(10,2) DEFAULT 0.00,
  `unit` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(1) DEFAULT 0,
  `deliverable` tinyint(1) DEFAULT 1,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `is_archived` tinyint(1) NOT NULL DEFAULT 0,
  `menu_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `disable_discounts` tinyint(1) NOT NULL DEFAULT 0,
  `disable_coupon_discount` tinyint(1) DEFAULT 0,
  `disable_wallet_discount` tinyint(1) DEFAULT 0,
  `disable_pickup_discount` tinyint(1) DEFAULT 0,
  `max_choice` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `food_offer_condition`
--

CREATE TABLE `food_offer_condition` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `offer_condition_id` bigint(20) UNSIGNED NOT NULL,
  `food_id` bigint(20) UNSIGNED NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `food_orders`
--

CREATE TABLE `food_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `app_discount_price` decimal(10,2) DEFAULT NULL,
  `store_discount_price` decimal(10,2) DEFAULT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `food_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `size_id` bigint(20) UNSIGNED DEFAULT NULL,
  `extras` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (`extras` is null or json_valid(`extras`)),
  `preferences` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (`preferences` is null or json_valid(`preferences`)),
  `total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `food_orders_history`
--

CREATE TABLE `food_orders_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `app_discount_price` decimal(10,2) DEFAULT NULL,
  `store_discount_price` decimal(10,2) DEFAULT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `food_order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `food_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `size_id` bigint(20) UNSIGNED DEFAULT NULL,
  `extras` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (`extras` is null or json_valid(`extras`)),
  `preferences` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (`preferences` is null or json_valid(`preferences`)),
  `total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `food_preferences`
--

CREATE TABLE `food_preferences` (
  `food_id` bigint(20) UNSIGNED NOT NULL,
  `preferences_id` bigint(20) UNSIGNED NOT NULL,
  `active` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `food_rate`
-- (See below for the actual view)
--
CREATE TABLE `food_rate` (
`food_id` bigint(20) unsigned
,`rate` decimal(7,4)
,`total` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `food_reviews`
--

CREATE TABLE `food_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `food_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `food_types`
--

CREATE TABLE `food_types` (
  `type_id` bigint(20) UNSIGNED NOT NULL,
  `food_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_image` tinyint(1) DEFAULT 0,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `google_directions_distances`
--

CREATE TABLE `google_directions_distances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `origin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `destination` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `distance` double(8,2) NOT NULL,
  `expires_at` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `happy_hours`
--

CREATE TABLE `happy_hours` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED DEFAULT NULL,
  `from_time` time NOT NULL,
  `to_time` time NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `is_single` tinyint(1) NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`title`)),
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`body`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `happy_hour_restaurant`
--

CREATE TABLE `happy_hour_restaurant` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `happy_hours_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ha_translations`
--

CREATE TABLE `ha_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hot_offers`
--

CREATE TABLE `hot_offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `price` double NOT NULL,
  `food_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_date` date NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_orders` int(11) NOT NULL,
  `cancelled_orders` int(11) NOT NULL,
  `total_value` decimal(10,2) NOT NULL,
  `system_due` decimal(10,2) NOT NULL,
  `system_vouchers` decimal(10,2) NOT NULL,
  `store_vouchers` decimal(10,2) NOT NULL,
  `store_due` decimal(10,2) NOT NULL,
  `cancellation_adjustments` decimal(10,2) NOT NULL,
  `cancellation_50_50` decimal(10,2) NOT NULL,
  `cash_payments` decimal(10,2) NOT NULL,
  `previous_balance` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `in_app_messages`
--

CREATE TABLE `in_app_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `should_fire_alarm` tinyint(1) NOT NULL DEFAULT 0,
  `notifiable_type` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_at` time NOT NULL,
  `end_at` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu_builders`
--

CREATE TABLE `menu_builders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`title`)),
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `segments` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excluded_segments` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu_builder_roles`
--

CREATE TABLE `menu_builder_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_builder_id` bigint(20) UNSIGNED DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `conversation_id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `receiver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mobile_widgets`
--

CREATE TABLE `mobile_widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'container',
  `widget_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (`data` is null or json_valid(`data`)),
  `children` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (`children` is null or json_valid(`children`)),
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `order` int(11) NOT NULL DEFAULT 0,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_do_not_has_permissions`
--

CREATE TABLE `model_do_not_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `notable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notable_id` bigint(20) UNSIGNED NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by_user_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notification_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `notification_type_options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (`notification_type_options` is null or json_valid(`notification_type_options`)),
  `topic` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_text` tinyint(1) DEFAULT 1,
  `active` tinyint(1) DEFAULT 0,
  `caption` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`caption`)),
  `bannertype` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `section` bigint(20) UNSIGNED DEFAULT NULL,
  `store` bigint(20) UNSIGNED DEFAULT NULL,
  `nav_route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nav_param` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `navstore` bigint(20) UNSIGNED DEFAULT NULL,
  `navfood` bigint(20) UNSIGNED DEFAULT NULL,
  `notifiable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `notification_times_active` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_seen`
--

CREATE TABLE `notification_seen` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `notification_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_sents`
--

CREATE TABLE `notification_sents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_by_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `notification_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `snapshot_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (`snapshot_data` is null or json_valid(`snapshot_data`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_sent_user`
--

CREATE TABLE `notification_sent_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `notification_sent_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_times`
--

CREATE TABLE `notification_times` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `day` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_types`
--

CREATE TABLE `notification_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`name`)),
  `type` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_type_options`
--

CREATE TABLE `notification_type_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `notification_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `addition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nutrition`
--

CREATE TABLE `nutrition` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`name`)),
  `quantity` int(10) UNSIGNED DEFAULT 0,
  `food_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`title`)),
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`description`)),
  `title_color` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_color` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_color_light` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_color_light` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_color` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_color_light` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_color` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_color_light` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_position` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT 1,
  `mode` enum('image_text','image','text') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'image_text',
  `nav_route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nav_param` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` tinyint(1) NOT NULL DEFAULT 0,
  `is_guest` enum('','1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Is this offer for guests?',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offer_conditions`
--

CREATE TABLE `offer_conditions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`name`)),
  `min_item` double DEFAULT 0,
  `min_cart` double DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirm_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `cancelled_by` bigint(20) UNSIGNED DEFAULT NULL,
  `order_status_id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `app_deliver` tinyint(1) DEFAULT NULL,
  `pickup` tinyint(1) DEFAULT 0,
  `tax` decimal(10,2) DEFAULT 0.00,
  `delivery_fee` decimal(10,2) DEFAULT 0.00,
  `driver_fee` decimal(10,2) DEFAULT NULL,
  `hint` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `driver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon_id` bigint(20) UNSIGNED DEFAULT NULL,
  `wallet_pay` tinyint(1) DEFAULT 0,
  `has_item_with_discount` tinyint(1) NOT NULL DEFAULT 0,
  `has_hot_offer` tinyint(1) NOT NULL DEFAULT 0,
  `has_conditional_offers` tinyint(1) NOT NULL DEFAULT 0,
  `wallet_transaction_id` bigint(20) UNSIGNED DEFAULT NULL,
  `compensation_transaction_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'This field is for compensation transaction id use to check if compensation is made',
  `compensation_coupon_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'This field is for compensation coupon id use to check if compensation is made',
  `accept_at` timestamp NULL DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL,
  `rejected_at` datetime DEFAULT NULL,
  `preparing_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_delivery_address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_delivery_fee_calculations_id` bigint(20) UNSIGNED DEFAULT NULL,
  `latitude` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approximate_distance` decimal(10,2) NOT NULL DEFAULT 0.00,
  `customer_distance` decimal(8,2) NOT NULL DEFAULT 0.00,
  `store_distance` decimal(8,2) NOT NULL DEFAULT 0.00,
  `processing` tinyint(1) NOT NULL DEFAULT 0,
  `app_commission` decimal(10,2) DEFAULT 0.00,
  `commission_includes_tax` tinyint(1) NOT NULL DEFAULT 0,
  `commission_tax` double NOT NULL DEFAULT 0,
  `commission_with_tax` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cancellation_reason_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cancellation_reason_note` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_cancellation_fees` decimal(10,2) NOT NULL DEFAULT 0.00,
  `store_cancellation_fees` decimal(10,2) NOT NULL DEFAULT 0.00,
  `app_cancellation_percentage` int(11) DEFAULT NULL,
  `store_cancellation_percentage` int(11) DEFAULT NULL,
  `returned_to_store` tinyint(1) NOT NULL DEFAULT 0,
  `returned_to_store_at` datetime DEFAULT NULL,
  `assigned_to_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `assigned_how_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `mco` int(11) DEFAULT NULL COMMENT 'Multi Captains Order count that the order need to deliver',
  `pre_order_at` datetime DEFAULT NULL COMMENT 'This field is for pre order module it is time to receive order at',
  `is_restaurant_partner` tinyint(1) NOT NULL DEFAULT 1,
  `service_fee` double(8,2) NOT NULL DEFAULT 0.00,
  `edit_auth` tinyint(1) DEFAULT 0,
  `pay_on_spot` tinyint(1) DEFAULT 1,
  `toggle_rate` tinyint(1) DEFAULT 1,
  `was_ready` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_delivery_address`
--

CREATE TABLE `order_delivery_address` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `building` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `floor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apartment` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_delivery_fee_calculations`
--

CREATE TABLE `order_delivery_fee_calculations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `initial_km_distance` double(8,2) NOT NULL,
  `initial_km_fees` double(8,2) NOT NULL,
  `additional_km_fees` double(8,2) NOT NULL,
  `order_additional_distance` double(8,2) NOT NULL,
  `order_initial_distance` double(8,2) NOT NULL,
  `order_delivery_fee` double(8,2) NOT NULL,
  `delivery_fee_calculation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `partner` tinyint(1) NOT NULL,
  `delivery_vehicle_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `is_free` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_distance` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_discounts`
--

CREATE TABLE `order_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `app_percentage` int(11) DEFAULT 0,
  `store_percentage` int(11) DEFAULT 0,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `order_earnings_per_day`
-- (See below for the actual view)
--
CREATE TABLE `order_earnings_per_day` (
`order_id` bigint(20) unsigned
,`branch_id` bigint(20) unsigned
,`restaurant_id` bigint(20) unsigned
,`day` date
,`status_id` bigint(20) unsigned
,`total` decimal(32,2)
,`app` double
,`app_commission_tax` double
,`store` double
,`service_fee` double(23,6)
,`app_food_discounts` decimal(42,2)
,`total_discounts` decimal(32,2)
,`app_discounts` decimal(46,6)
,`store_discounts` decimal(46,6)
,`delivery_fee` decimal(32,2)
,`app_delivery_fee` decimal(32,2)
,`store_delivery_fee` decimal(32,2)
,`app_cancellation_fees` decimal(32,2)
,`store_cancellation_fees` decimal(32,2)
,`is_cancel_50_50` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `order_history`
--

CREATE TABLE `order_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `cancelled_by` bigint(20) UNSIGNED DEFAULT NULL,
  `order_status_id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `app_deliver` tinyint(1) DEFAULT NULL,
  `pickup` tinyint(1) DEFAULT 0,
  `tax` decimal(10,2) DEFAULT 0.00,
  `delivery_fee` decimal(10,2) DEFAULT 0.00,
  `driver_fee` decimal(10,2) DEFAULT NULL,
  `hint` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `driver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon_id` bigint(20) UNSIGNED DEFAULT NULL,
  `wallet_pay` tinyint(1) DEFAULT 0,
  `has_item_with_discount` tinyint(1) NOT NULL DEFAULT 0,
  `has_hot_offer` tinyint(1) NOT NULL DEFAULT 0,
  `has_conditional_offers` tinyint(1) NOT NULL DEFAULT 0,
  `wallet_transaction_id` bigint(20) UNSIGNED DEFAULT NULL,
  `compensation_transaction_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'This field is for compensation transaction id use to check if compensation is made',
  `accept_at` timestamp NULL DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL,
  `rejected_at` datetime DEFAULT NULL,
  `preparing_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_delivery_address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_delivery_fee_calculations_id` bigint(20) UNSIGNED DEFAULT NULL,
  `latitude` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approximate_distance` decimal(10,2) NOT NULL DEFAULT 0.00,
  `customer_distance` decimal(8,2) NOT NULL DEFAULT 0.00,
  `store_distance` decimal(8,2) NOT NULL DEFAULT 0.00,
  `processing` tinyint(1) NOT NULL DEFAULT 0,
  `app_commission` decimal(10,2) DEFAULT 0.00,
  `commission_includes_tax` tinyint(1) NOT NULL DEFAULT 0,
  `commission_tax` double NOT NULL DEFAULT 0,
  `commission_with_tax` double NOT NULL DEFAULT 0,
  `cancellation_reason_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cancellation_reason_note` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_cancellation_fees` decimal(10,2) NOT NULL DEFAULT 0.00,
  `store_cancellation_fees` decimal(10,2) NOT NULL DEFAULT 0.00,
  `returned_to_store` tinyint(1) NOT NULL DEFAULT 0,
  `returned_to_store_at` datetime DEFAULT NULL,
  `assigned_to_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `assigned_how_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `mco` int(11) DEFAULT NULL COMMENT 'Multi Captains Order count that the order need to deliver',
  `pre_order_at` datetime DEFAULT NULL COMMENT 'This field is for pre order module it is time to receive order at',
  `is_restaurant_partner` tinyint(1) NOT NULL DEFAULT 1,
  `service_fee` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `pay_on_spot` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_info`
--

CREATE TABLE `order_info` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `driver_rate` decimal(10,2) DEFAULT NULL,
  `driver_fee` decimal(10,2) DEFAULT NULL,
  `driver_fee_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickup_discount_percentage` decimal(10,2) DEFAULT NULL,
  `pickup_discount_limit` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `driver_collected` decimal(10,2) DEFAULT NULL,
  `driver_paid` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_log`
--

CREATE TABLE `order_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `time` timestamp NOT NULL DEFAULT '2025-02-23 10:15:12',
  `status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `driver_lat` double DEFAULT NULL,
  `driver_lag` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_rejections`
--

CREATE TABLE `order_rejections` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `cancellation_reason_note` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancellation_reason_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rejected_by` bigint(20) UNSIGNED DEFAULT NULL,
  `confirmed_by` bigint(20) UNSIGNED DEFAULT NULL,
  `rejected_at` datetime NOT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `is_confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_statuses`
--

CREATE TABLE `order_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`status`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_update_infos`
--

CREATE TABLE `order_update_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `collected_from_client` decimal(10,2) DEFAULT NULL,
  `accept_discounts` tinyint(1) NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `support_online_payment` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `otps`
--

CREATE TABLE `otps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `identifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `validity` int(11) NOT NULL,
  `expired` tinyint(1) NOT NULL DEFAULT 0,
  `no_times_generated` int(11) NOT NULL DEFAULT 0,
  `no_times_attempted` int(11) NOT NULL DEFAULT 0,
  `generated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`name`)),
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`description`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages_log`
--

CREATE TABLE `packages_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subscription_start_at` date NOT NULL,
  `subscription_end_at` date NOT NULL,
  `fee` decimal(10,2) NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_at` date DEFAULT NULL,
  `end_by` bigint(20) UNSIGNED DEFAULT NULL,
  `end_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `package_fees`
--

CREATE TABLE `package_fees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `fee` decimal(8,2) NOT NULL,
  `duration` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_reference` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('pending','captured','declined','refunded') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `method` enum('cash','credit_card','vodafone_cash','my_balance','pickup','hybrid','employee_wallet') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payable_id` bigint(20) UNSIGNED NOT NULL,
  `paid_amount` decimal(20,2) DEFAULT 0.00,
  `remaining_amount` decimal(20,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_details`
--

CREATE TABLE `payment_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_log`
--

CREATE TABLE `payment_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pending_orders`
--

CREATE TABLE `pending_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `cancelled_by` bigint(20) UNSIGNED DEFAULT NULL,
  `order_status_id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `app_deliver` tinyint(1) DEFAULT NULL,
  `pickup` tinyint(1) DEFAULT 0,
  `tax` decimal(10,2) DEFAULT 0.00,
  `delivery_fee` decimal(10,2) DEFAULT 0.00,
  `driver_fee` decimal(10,2) DEFAULT NULL,
  `hint` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `driver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon_id` bigint(20) UNSIGNED DEFAULT NULL,
  `wallet_pay` tinyint(1) DEFAULT 0,
  `has_item_with_discount` tinyint(1) NOT NULL DEFAULT 0,
  `has_hot_offer` tinyint(1) NOT NULL DEFAULT 0,
  `has_conditional_offers` tinyint(1) NOT NULL DEFAULT 0,
  `wallet_transaction_id` bigint(20) UNSIGNED DEFAULT NULL,
  `compensation_transaction_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'This field is for compensation transaction id use to check if compensation is made',
  `accept_at` timestamp NULL DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL,
  `rejected_at` datetime DEFAULT NULL,
  `preparing_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_delivery_address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_delivery_fee_calculations_id` bigint(20) UNSIGNED DEFAULT NULL,
  `latitude` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approximate_distance` decimal(10,2) NOT NULL DEFAULT 0.00,
  `customer_distance` decimal(8,2) NOT NULL DEFAULT 0.00,
  `store_distance` decimal(8,2) NOT NULL DEFAULT 0.00,
  `processing` tinyint(1) NOT NULL DEFAULT 0,
  `app_commission` decimal(10,2) DEFAULT 0.00,
  `commission_includes_tax` tinyint(1) NOT NULL DEFAULT 0,
  `commission_tax` double NOT NULL DEFAULT 0,
  `commission_with_tax` double NOT NULL DEFAULT 0,
  `cancellation_reason_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cancellation_reason_note` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_cancellation_fees` decimal(10,2) NOT NULL DEFAULT 0.00,
  `store_cancellation_fees` decimal(10,2) NOT NULL DEFAULT 0.00,
  `returned_to_store` tinyint(1) NOT NULL DEFAULT 0,
  `returned_to_store_at` datetime DEFAULT NULL,
  `assigned_to_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `assigned_how_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `mco` int(11) DEFAULT NULL COMMENT 'Multi Captains Order count that the order need to deliver',
  `pre_order_at` datetime DEFAULT NULL COMMENT 'This field is for pre order module it is time to receive order at',
  `is_restaurant_partner` tinyint(1) NOT NULL DEFAULT 1,
  `service_fee` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `pay_on_spot` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pending_order_discounts`
--

CREATE TABLE `pending_order_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pending_order_id` bigint(20) UNSIGNED NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `app_percentage` int(11) DEFAULT 0,
  `store_percentage` int(11) DEFAULT 0,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pending_order_foods`
--

CREATE TABLE `pending_order_foods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `app_discount_price` decimal(10,2) DEFAULT NULL,
  `store_discount_price` decimal(10,2) DEFAULT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `food_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pending_order_id` bigint(20) UNSIGNED NOT NULL,
  `size_id` bigint(20) UNSIGNED DEFAULT NULL,
  `extras` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (`extras` is null or json_valid(`extras`)),
  `preferences` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (`preferences` is null or json_valid(`preferences`)),
  `total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_group`
--

CREATE TABLE `permission_group` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_verify_logs`
--

CREATE TABLE `phone_verify_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified_at` datetime DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `policies`
--

CREATE TABLE `policies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `policy_roles`
--

CREATE TABLE `policy_roles` (
  `policy_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `popups`
--

CREATE TABLE `popups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `food_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`title`)),
  `summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`summary`)),
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`content`)),
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (`tags` is null or json_valid(`tags`)),
  `owner` bigint(20) UNSIGNED NOT NULL,
  `read_count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `preferences`
--

CREATE TABLE `preferences` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`name`)),
  `preferences_group_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `preferences_group`
--

CREATE TABLE `preferences_group` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`name`)),
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`description`)),
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `multiple` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `force` tinyint(1) NOT NULL DEFAULT 0,
  `max` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `preferences_size`
--

CREATE TABLE `preferences_size` (
  `preferences_id` bigint(20) UNSIGNED NOT NULL,
  `size_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `preferred_sections`
--

CREATE TABLE `preferred_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ragions`
--

CREATE TABLE `ragions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sort` int(11) NOT NULL,
  `ragion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referral_users`
--

CREATE TABLE `referral_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `referral_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reset_code_passwords`
--

CREATE TABLE `reset_code_passwords` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `photo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`name`)),
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`description`)),
  `special_offer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`special_offer`)),
  `classification` int(11) DEFAULT NULL,
  `contact_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_commission` decimal(10,2) DEFAULT 0.00,
  `delivery_fee` decimal(10,2) DEFAULT 0.00,
  `delivery_range` decimal(10,2) DEFAULT 0.00,
  `default_tax` decimal(10,2) DEFAULT 0.00,
  `default_delivery_time_from` int(11) NOT NULL,
  `default_delivery_time_to` int(11) DEFAULT NULL,
  `default_preparing_time` int(11) NOT NULL,
  `max_preparing_time` int(11) NOT NULL,
  `restaurant_status_id` bigint(20) UNSIGNED DEFAULT 1,
  `sector_id` bigint(20) UNSIGNED DEFAULT NULL,
  `free_delivery` tinyint(1) DEFAULT 0,
  `vip` tinyint(1) DEFAULT 0,
  `outdoor` tinyint(1) NOT NULL DEFAULT 0,
  `partner` tinyint(1) DEFAULT 1,
  `active` tinyint(1) DEFAULT 0,
  `available_for_delivery` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `update_status_automatically` tinyint(1) NOT NULL DEFAULT 1,
  `tax_card_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commercial_registration_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `app_booking_fee` decimal(10,2) DEFAULT 0.00,
  `support_online_payment` tinyint(1) NOT NULL DEFAULT 1,
  `accept_discounts` tinyint(1) NOT NULL DEFAULT 1,
  `order_limit_value` double DEFAULT 0,
  `have_offers` tinyint(1) NOT NULL DEFAULT 0,
  `have_discounts` tinyint(1) NOT NULL DEFAULT 0,
  `is_terminated` tinyint(1) NOT NULL DEFAULT 0,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `is_breakfast` tinyint(1) NOT NULL DEFAULT 0,
  `bank_account_owner_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_wallet_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_custom_delivery_fee` tinyint(1) DEFAULT 0,
  `pay_on_spot` tinyint(1) DEFAULT 1,
  `custom_delivery_range` decimal(10,2) DEFAULT 0.00,
  `disable_pickup` tinyint(1) DEFAULT 0,
  `commission_includes_tax` tinyint(1) NOT NULL DEFAULT 0,
  `restaurant_inactive_reason_id` bigint(20) UNSIGNED DEFAULT NULL,
  `registered_at` date DEFAULT NULL,
  `payout_duration` enum('monthly','half_month','weekly') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'monthly',
  `first_time_active` datetime DEFAULT NULL,
  `first_time_set_partner` datetime DEFAULT NULL,
  `last_time_terminated` datetime DEFAULT NULL,
  `who_terminated_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `inactive_note` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurants_payouts`
--

CREATE TABLE `restaurants_payouts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `accounting_date` date DEFAULT NULL,
  `method` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `doc_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_conversations`
--

CREATE TABLE `restaurant_conversations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_cuisines`
--

CREATE TABLE `restaurant_cuisines` (
  `cuisine_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_custom_delivery_fees`
--

CREATE TABLE `restaurant_custom_delivery_fees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `initial_km_distance` double(8,2) NOT NULL,
  `initial_km_fees` double(8,2) NOT NULL,
  `additional_km_fees` double(8,2) NOT NULL,
  `is_free` tinyint(1) DEFAULT 0,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_vehicle_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_excluded_zones`
--

CREATE TABLE `restaurant_excluded_zones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_groups`
--

CREATE TABLE `restaurant_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`name`)),
  `active` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_inactive_reasons`
--

CREATE TABLE `restaurant_inactive_reasons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_requests`
--

CREATE TABLE `restaurant_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch_address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sector_id` bigint(20) UNSIGNED DEFAULT NULL,
  `num_of_branches` int(11) NOT NULL DEFAULT 1,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Under Revision',
  `viewed_at` datetime DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_reviews`
--

CREATE TABLE `restaurant_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_sector`
--

CREATE TABLE `restaurant_sector` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sector_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_slides`
--

CREATE TABLE `restaurant_slides` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `indicator_color` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_fit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'cover',
  `food_id` bigint(20) UNSIGNED DEFAULT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_status`
--

CREATE TABLE `restaurant_status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`status`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_types`
--

CREATE TABLE `restaurant_types` (
  `type_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_zone_delivery_fees`
--

CREATE TABLE `restaurant_zone_delivery_fees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_fee` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web',
  `default` tinyint(1) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `restricted_zones` tinyint(1) NOT NULL DEFAULT 0,
  `vendor_restriction` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sectors`
--

CREATE TABLE `sectors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`name`)),
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`description`)),
  `is_banner` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount_price` decimal(10,2) DEFAULT 0.00,
  `app_discount_price` decimal(10,2) DEFAULT NULL,
  `store_discount_price` decimal(10,2) DEFAULT NULL,
  `food_id` bigint(20) UNSIGNED NOT NULL,
  `size_group_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `size_group`
--

CREATE TABLE `size_group` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`name`)),
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`description`)),
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `status_reasons`
--

CREATE TABLE `status_reasons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`name`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `status_reasons`
--

INSERT INTO `status_reasons` (`id`, `name`, `created_at`, `updated_at`, `type`) VALUES
(1, '{\"ar\":\"\\u0633\\u0627\\u0639\\u0627\\u062a \\u0627\\u0644\\u0630\\u0631\\u0648\\u0629\",\"en\":\"Rush Time\"}', '2023-06-05 16:51:48', '2023-06-05 16:51:48', 'Busy'),
(2, '{\"ar\":\"\\u0645\\u0634\\u0643\\u0644\\u0629 \\u062a\\u0642\\u0646\\u064a\\u0629\",\"en\":\"Technical Issue\"}', '2023-06-05 16:51:48', '2023-06-05 16:51:48', 'Busy'),
(3, '{\"ar\":\"\\u0645\\u0634\\u0643\\u0644\\u0629 \\u0643\\u0647\\u0631\\u0628\\u0627\\u0621\",\"en\":\"Electricity Issue\"}', '2023-06-05 16:51:48', '2023-06-05 16:51:48', 'Busy'),
(4, '{\"ar\":\"\\u0645\\u0634\\u0643\\u0644\\u0629 \\u0637\\u0642\\u0633\",\"en\":\"Weather Issue\"}', '2023-06-05 16:51:48', '2023-06-05 16:51:48', 'Busy'),
(5, '{\"ar\":\"\\u0644\\u0627 \\u064a\\u0648\\u062c\\u062f \\u0643\\u0628\\u0627\\u062a\\u0646\",\"en\":\"No Captains\"}', '2023-06-05 16:51:48', '2023-06-05 16:51:48', 'Busy'),
(6, '{\"ar\":\"\\u0627\\u062e\\u0631\\u064a\",\"en\":\"Other\"}', '2023-06-05 16:51:48', '2023-06-05 16:51:48', 'Busy'),
(7, '{\"ar\":\"\\u0645\\u0634\\u0643\\u0644\\u0629 \\u062a\\u0642\\u0646\\u064a\\u0629\",\"en\":\"Technical Issue\"}', '2023-06-05 16:51:48', '2023-06-05 16:51:48', 'Close'),
(8, '{\"ar\":\"\\u062a\\u062c\\u062f\\u064a\\u062f\",\"en\":\"Renovation\"}', '2023-06-05 16:51:48', '2023-06-05 16:51:48', 'Close'),
(9, '{\"ar\":\"\\u062e\\u0627\\u0631\\u062c \\u0627\\u0644\\u0639\\u0645\\u0644\",\"en\":\"Out of Business\"}', '2023-06-05 16:51:48', '2023-06-05 16:51:48', 'Close'),
(10, '{\"ar\":\"\\u0627\\u0646\\u062a\\u0647\\u0627\\u0621 \\u0627\\u0644\\u0639\\u0642\\u062f\",\"en\":\"End Deal\"}', '2023-06-05 16:51:48', '2023-06-05 16:51:48', 'Close'),
(11, '{\"ar\":\"\\u0627\\u062e\\u0631\\u064a\",\"en\":\"Other\"}', '2023-06-05 16:51:48', '2023-06-05 16:51:48', 'Close');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `term_roles`
--

CREATE TABLE `term_roles` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `total_zones`
--

CREATE TABLE `total_zones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `polygon` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (`polygon` is null or json_valid(`polygon`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`name`)),
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`description`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `can_booking` tinyint(1) DEFAULT 1,
  `missed_booking_count` tinyint(1) DEFAULT 0,
  `suspended` tinyint(1) DEFAULT 0,
  `suspension_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_alt` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `own_payment` tinyint(1) DEFAULT 0,
  `user_status_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `device_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_last_four` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keepalive` timestamp NULL DEFAULT NULL,
  `is_alive` tinyint(1) NOT NULL DEFAULT 0,
  `jwt_token` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apple_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_expires_at` datetime DEFAULT NULL,
  `blocked_at` timestamp NULL DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `archived_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `suspended_at` datetime DEFAULT NULL,
  `suspended_by` bigint(20) UNSIGNED DEFAULT NULL,
  `order_rate_attempts` int(11) DEFAULT 0,
  `is_employee` tinyint(1) NOT NULL DEFAULT 0,
  `force_password` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_branches`
--

CREATE TABLE `user_branches` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_cities`
--

CREATE TABLE `user_cities` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_coupons`
--

CREATE TABLE `user_coupons` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_restaurants`
--

CREATE TABLE `user_restaurants` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_restaurant_groups`
--

CREATE TABLE `user_restaurant_groups` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_group_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_status`
--

CREATE TABLE `user_status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`status`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_vendors`
--

CREATE TABLE `user_vendors` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_zones`
--

CREATE TABLE `user_zones` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visits`
--

CREATE TABLE `visits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `visited_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `balance` decimal(10,2) DEFAULT 0.00,
  `spent` decimal(10,2) DEFAULT 0.00,
  `last_use` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `wallet_id` bigint(20) UNSIGNED NOT NULL,
  `depit` decimal(10,2) DEFAULT 0.00,
  `credit` decimal(10,2) DEFAULT 0.00,
  `balance` decimal(10,2) DEFAULT 0.00,
  `statement` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`statement`)),
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`name`)),
  `polygon` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (`polygon` is null or json_valid(`polygon`)),
  `show_in_global_zone` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `area_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `areas_city_id_foreign` (`city_id`);

--
-- Indexes for table `assist_drivers`
--
ALTER TABLE `assist_drivers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assist_drivers_order_id_foreign` (`order_id`),
  ADD KEY `assist_drivers_driver_id_foreign` (`driver_id`);

--
-- Indexes for table `audience_coupon_user`
--
ALTER TABLE `audience_coupon_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audience_coupon_user_coupon_id_foreign` (`coupon_id`),
  ADD KEY `audience_coupon_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `balances`
--
ALTER TABLE `balances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `balances_user_id_foreign` (`user_id`);

--
-- Indexes for table `balance_transactions`
--
ALTER TABLE `balance_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `balance_transactions_user_id_foreign` (`user_id`),
  ADD KEY `balance_transactions_balance_id_foreign` (`balance_id`),
  ADD KEY `balance_transactions_order_id_foreign` (`order_id`),
  ADD KEY `balance_transactions_receiver_id_foreign` (`receiver_id`),
  ADD KEY `balance_transactions_sender_id_foreign` (`sender_id`),
  ADD KEY `balance_transactions_created_by_foreign` (`created_by`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_user_id_foreign` (`user_id`),
  ADD KEY `bookings_status_id_foreign` (`status_id`),
  ADD KEY `bookings_branch_id_foreign` (`branch_id`),
  ADD KEY `bookings_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `booking_inactive_times`
--
ALTER TABLE `booking_inactive_times`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_status`
--
ALTER TABLE `booking_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `followup_user_id_foreign` (`user_id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branches_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `branches_branch_status_id_foreign` (`branch_status_id`),
  ADD KEY `branches_zone_id_foreign` (`zone_id`),
  ADD KEY `branches_city_id_foreign` (`city_id`),
  ADD KEY `branches_code_index` (`code`),
  ADD KEY `branches_restaurant_inactive_reason_id_foreign` (`restaurant_inactive_reason_id`);

--
-- Indexes for table `branch_rush_days`
--
ALTER TABLE `branch_rush_days`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branch_rush_days_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `branch_sessions`
--
ALTER TABLE `branch_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branch_sessions_branch_id_foreign` (`branch_id`),
  ADD KEY `branch_sessions_status_id_foreign` (`status_id`),
  ADD KEY `branch_sessions_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `branch_sessions_start_at_index` (`start_at`),
  ADD KEY `branch_sessions_end_at_index` (`end_at`),
  ADD KEY `branch_sessions_status_id_index` (`status_id`);

--
-- Indexes for table `branch_statistics`
--
ALTER TABLE `branch_statistics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branch_statistics_branch_id_foreign` (`branch_id`),
  ADD KEY `branch_statistics_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `camera_requests`
--
ALTER TABLE `camera_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `camera_requests_driver_id_foreign` (`driver_id`),
  ADD KEY `camera_requests_driver_captured_image_id_foreign` (`driver_captured_image_id`);

--
-- Indexes for table `cancellation_reasons`
--
ALTER TABLE `cancellation_reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cancellation_reason_role`
--
ALTER TABLE `cancellation_reason_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cancellation_reason_role_cancellation_reason_id_foreign` (`cancellation_reason_id`),
  ADD KEY `cancellation_reason_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `captain_providers`
--
ALTER TABLE `captain_providers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `captain_providers_code_unique` (`code`),
  ADD KEY `captain_providers_user_id_foreign` (`user_id`);

--
-- Indexes for table `captain_provider_zones`
--
ALTER TABLE `captain_provider_zones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `captain_provider_zones_captain_provider_id_foreign` (`captain_provider_id`),
  ADD KEY `captain_provider_zones_city_id_foreign` (`city_id`),
  ADD KEY `captain_provider_zones_zone_id_foreign` (`zone_id`);

--
-- Indexes for table `career_faqs`
--
ALTER TABLE `career_faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `career_positions`
--
ALTER TABLE `career_positions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `career_sliders`
--
ALTER TABLE `career_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `career_teams`
--
ALTER TABLE `career_teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `career_videos`
--
ALTER TABLE `career_videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_branch_id_foreign` (`branch_id`),
  ADD KEY `carts_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Indexes for table `cart_foods`
--
ALTER TABLE `cart_foods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_foods_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_foods_food_id_foreign` (`food_id`),
  ADD KEY `cart_foods_size_id_foreign` (`size_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `categories_cuisine_id_foreign` (`cuisine_id`),
  ADD KEY `categories_sector_id_foreign` (`sector_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clubs`
--
ALTER TABLE `clubs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clubs_user_id_foreign` (`user_id`);

--
-- Indexes for table `collection_banners`
--
ALTER TABLE `collection_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `collection_banner_items`
--
ALTER TABLE `collection_banner_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `collection_banner_items_collection_banner_id_foreign` (`collection_banner_id`),
  ADD KEY `collection_banner_items_target_type_target_id_index` (`target_type`,`target_id`);

--
-- Indexes for table `compensation`
--
ALTER TABLE `compensation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `compensation_conditions`
--
ALTER TABLE `compensation_conditions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compensation_conditions_role_id_foreign` (`role_id`);

--
-- Indexes for table `compensation_role`
--
ALTER TABLE `compensation_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compensation_role_compensation_id_foreign` (`compensation_id`),
  ADD KEY `compensation_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`),
  ADD KEY `complaints_target_type_target_id_index` (`target_type`,`target_id`);

--
-- Indexes for table `complaint_actions`
--
ALTER TABLE `complaint_actions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `complaint_actions_complaint_id_foreign` (`complaint_id`);

--
-- Indexes for table `constrained_order_confirmation`
--
ALTER TABLE `constrained_order_confirmation`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `contact_person`
--
ALTER TABLE `contact_person`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_person_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conversations_conversationable_type_conversationable_id_index` (`conversationable_type`,`conversationable_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`),
  ADD KEY `coupons_created_by_foreign` (`created_by`),
  ADD KEY `coupons_user_id_foreign` (`user_id`);

--
-- Indexes for table `coupon_campaign_targets`
--
ALTER TABLE `coupon_campaign_targets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupon_campaign_targets_code_unique` (`code`),
  ADD KEY `coupon_campaign_targets_coupon_id_foreign` (`coupon_id`),
  ADD KEY `coupon_campaign_targets_user_id_foreign` (`user_id`);

--
-- Indexes for table `coupon_requests`
--
ALTER TABLE `coupon_requests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupon_requests_code_unique` (`code`),
  ADD KEY `coupon_requests_created_by_foreign` (`created_by`),
  ADD KEY `coupon_requests_approved_by_user_id_foreign` (`approved_by_user_id`),
  ADD KEY `coupon_requests_user_id_foreign` (`user_id`);

--
-- Indexes for table `coupon_times`
--
ALTER TABLE `coupon_times`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupon_times_coupon_id_foreign` (`coupon_id`);

--
-- Indexes for table `cuisines`
--
ALTER TABLE `cuisines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deep_link_short_codes`
--
ALTER TABLE `deep_link_short_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `deep_link_short_codes_short_code_unique` (`short_code`);

--
-- Indexes for table `delivery_addresses`
--
ALTER TABLE `delivery_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_addresses_user_id_foreign` (`user_id`),
  ADD KEY `delivery_addresses_zone_id_foreign` (`zone_id`);

--
-- Indexes for table `delivery_vehicles`
--
ALTER TABLE `delivery_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discountables`
--
ALTER TABLE `discountables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discountables_coupon_id_foreign` (`coupon_id`);

--
-- Indexes for table `dispatching`
--
ALTER TABLE `dispatching`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dispatching_order_id_foreign` (`order_id`),
  ADD KEY `dispatching_driver_id_foreign` (`driver_id`),
  ADD KEY `dispatching_received_from_driver_id_foreign` (`received_from_driver_id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drivers_user_id_foreign` (`user_id`),
  ADD KEY `drivers_captain_provider_id_foreign` (`captain_provider_id`);

--
-- Indexes for table `drivers_fee`
--
ALTER TABLE `drivers_fee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drivers_fee_ragion_foreign` (`ragion`);

--
-- Indexes for table `drivers_payouts`
--
ALTER TABLE `drivers_payouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drivers_payouts_driver_id_foreign` (`driver_id`);

--
-- Indexes for table `driver_arrivals`
--
ALTER TABLE `driver_arrivals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_arrivals_order_id_foreign` (`order_id`),
  ADD KEY `driver_arrivals_driver_id_foreign` (`driver_id`);

--
-- Indexes for table `driver_captured_images`
--
ALTER TABLE `driver_captured_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_captured_images_session_id_foreign` (`session_id`);

--
-- Indexes for table `driver_cash_requests`
--
ALTER TABLE `driver_cash_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_cash_requests_driver_id_foreign` (`driver_id`),
  ADD KEY `driver_cash_requests_order_id_foreign` (`order_id`),
  ADD KEY `driver_cash_requests_status_by_id_foreign` (`status_by_id`);

--
-- Indexes for table `driver_day_offs`
--
ALTER TABLE `driver_day_offs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_day_offs_driver_id_foreign` (`driver_id`);

--
-- Indexes for table `driver_live_location_histories`
--
ALTER TABLE `driver_live_location_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `driver_order_notification`
--
ALTER TABLE `driver_order_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_order_notification_order_id_foreign` (`order_id`),
  ADD KEY `driver_order_notification_driver_id_foreign` (`driver_id`);

--
-- Indexes for table `driver_penalties`
--
ALTER TABLE `driver_penalties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `driver_requests`
--
ALTER TABLE `driver_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_requests_city_id_foreign` (`city_id`),
  ADD KEY `driver_requests_zone_id_foreign` (`zone_id`),
  ADD KEY `driver_requests_captain_provider_id_foreign` (`captain_provider_id`);

--
-- Indexes for table `driver_reviews`
--
ALTER TABLE `driver_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_reviews_user_id_foreign` (`user_id`),
  ADD KEY `driver_reviews_driver_id_foreign` (`driver_id`),
  ADD KEY `driver_reviews_order_id_foreign` (`order_id`);

--
-- Indexes for table `driver_sessions`
--
ALTER TABLE `driver_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_sessions_driver_id_foreign` (`driver_id`),
  ADD KEY `driver_sessions_status_id_foreign` (`status_id`),
  ADD KEY `driver_sessions_start_at_index` (`start_at`),
  ADD KEY `driver_sessions_end_at_index` (`end_at`),
  ADD KEY `driver_sessions_status_id_index` (`status_id`);

--
-- Indexes for table `driver_shifts`
--
ALTER TABLE `driver_shifts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `driver_shift_user`
--
ALTER TABLE `driver_shift_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_shift_user_driver_id_foreign` (`driver_id`),
  ADD KEY `driver_shift_user_driver_shift_id_foreign` (`driver_shift_id`);

--
-- Indexes for table `driver_statistics`
--
ALTER TABLE `driver_statistics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_statistics_driver_id_foreign` (`driver_id`);

--
-- Indexes for table `driver_zones`
--
ALTER TABLE `driver_zones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_zones_driver_id_foreign` (`driver_id`),
  ADD KEY `driver_zones_city_id_foreign` (`city_id`),
  ADD KEY `driver_zones_zone_id_foreign` (`zone_id`);

--
-- Indexes for table `email_verify_tokens`
--
ALTER TABLE `email_verify_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_verify_tokens_user_id_foreign` (`user_id`);

--
-- Indexes for table `employee_wallets`
--
ALTER TABLE `employee_wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_wallets_user_id_foreign` (`user_id`);

--
-- Indexes for table `employee_wallet_transactions`
--
ALTER TABLE `employee_wallet_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_wallet_transactions_employee_wallet_id_foreign` (`employee_wallet_id`),
  ADD KEY `employee_wallet_transactions_order_id_foreign` (`order_id`),
  ADD KEY `employee_wallet_transactions_user_id_foreign` (`user_id`);

--
-- Indexes for table `empty_extras_branches`
--
ALTER TABLE `empty_extras_branches`
  ADD KEY `empty_extras_branches_branch_id_foreign` (`branch_id`),
  ADD KEY `empty_extras_branches_extra_id_foreign` (`extra_id`);

--
-- Indexes for table `empty_preferences_branches`
--
ALTER TABLE `empty_preferences_branches`
  ADD PRIMARY KEY (`preference_id`,`branch_id`),
  ADD KEY `empty_preferences_branches_branch_id_foreign` (`branch_id`),
  ADD KEY `empty_preferences_branches_preference_id_foreign` (`preference_id`);

--
-- Indexes for table `empty_sizes_branches`
--
ALTER TABLE `empty_sizes_branches`
  ADD PRIMARY KEY (`size_id`,`branch_id`),
  ADD KEY `empty_sizes_branches_branch_id_foreign` (`branch_id`),
  ADD KEY `empty_sizes_branches_size_id_foreign` (`size_id`);

--
-- Indexes for table `empty_stock_branches`
--
ALTER TABLE `empty_stock_branches`
  ADD KEY `empty_stock_branches_food_id_foreign` (`food_id`),
  ADD KEY `empty_stock_branches_branch_id_foreign` (`branch_id`),
  ADD KEY `empty_stock_branches_created_by_foreign` (`created_by`);

--
-- Indexes for table `evaluations`
--
ALTER TABLE `evaluations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `explore_menu`
--
ALTER TABLE `explore_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `explore_menu_sector_id_foreign` (`sector_id`);

--
-- Indexes for table `extras`
--
ALTER TABLE `extras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `extras_extra_group_id_foreign` (`extra_group_id`),
  ADD KEY `extras_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `extra_food`
--
ALTER TABLE `extra_food`
  ADD PRIMARY KEY (`extra_id`,`food_id`),
  ADD KEY `extra_food_food_id_foreign` (`food_id`),
  ADD KEY `extra_food_extra_id_foreign` (`extra_id`);

--
-- Indexes for table `extra_groups`
--
ALTER TABLE `extra_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `extra_groups_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `extra_size`
--
ALTER TABLE `extra_size`
  ADD PRIMARY KEY (`extra_id`,`size_id`),
  ADD KEY `extra_size_extra_id_foreign` (`extra_id`),
  ADD KEY `extra_size_size_id_foreign` (`size_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faqs_faq_category_id_foreign` (`faq_category_id`);

--
-- Indexes for table `faq_categories`
--
ALTER TABLE `faq_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq_roles`
--
ALTER TABLE `faq_roles`
  ADD PRIMARY KEY (`faq_id`,`role_id`),
  ADD KEY `faq_roles_faq_id_foreign` (`faq_id`),
  ADD KEY `faq_roles_role_id_foreign` (`role_id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favorites_food_id_foreign` (`food_id`),
  ADD KEY `favorites_user_id_foreign` (`user_id`);

--
-- Indexes for table `favorite_extras`
--
ALTER TABLE `favorite_extras`
  ADD PRIMARY KEY (`favorite_id`,`extra_id`),
  ADD KEY `favorite_extras_extra_id_foreign` (`extra_id`),
  ADD KEY `favorite_extras_favorite_id_foreign` (`favorite_id`);

--
-- Indexes for table `first_time_passwords`
--
ALTER TABLE `first_time_passwords`
  ADD PRIMARY KEY (`id`),
  ADD KEY `first_time_passwords_user_id_foreign` (`user_id`);

--
-- Indexes for table `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foods_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `foods_category_id_foreign` (`category_id`),
  ADD KEY `foods_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `food_offer_condition`
--
ALTER TABLE `food_offer_condition`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_offer_condition_offer_condition_id_foreign` (`offer_condition_id`),
  ADD KEY `food_offer_condition_food_id_foreign` (`food_id`);

--
-- Indexes for table `food_orders`
--
ALTER TABLE `food_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_orders_food_id_foreign` (`food_id`),
  ADD KEY `food_orders_order_id_foreign` (`order_id`),
  ADD KEY `food_orders_size_id_foreign` (`size_id`);

--
-- Indexes for table `food_orders_history`
--
ALTER TABLE `food_orders_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_orders_history_food_id_foreign` (`food_id`),
  ADD KEY `food_orders_history_order_id_foreign` (`order_id`),
  ADD KEY `food_orders_history_size_id_foreign` (`size_id`),
  ADD KEY `food_orders_history_food_order_id_foreign` (`food_order_id`);

--
-- Indexes for table `food_preferences`
--
ALTER TABLE `food_preferences`
  ADD PRIMARY KEY (`preferences_id`,`food_id`),
  ADD KEY `food_preferences_food_id_foreign` (`food_id`),
  ADD KEY `food_preferences_preferences_id_foreign` (`preferences_id`);

--
-- Indexes for table `food_reviews`
--
ALTER TABLE `food_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_reviews_user_id_foreign` (`user_id`),
  ADD KEY `food_reviews_food_id_foreign` (`food_id`),
  ADD KEY `food_reviews_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `food_reviews_order_id_foreign` (`order_id`);

--
-- Indexes for table `food_types`
--
ALTER TABLE `food_types`
  ADD PRIMARY KEY (`type_id`,`food_id`),
  ADD KEY `food_types_type_id_foreign` (`type_id`),
  ADD KEY `food_types_food_id_foreign` (`food_id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `galleries_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `google_directions_distances`
--
ALTER TABLE `google_directions_distances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `happy_hours`
--
ALTER TABLE `happy_hours`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `happy_hour_restaurant`
--
ALTER TABLE `happy_hour_restaurant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `happy_hour_restaurant_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `happy_hour_restaurant_happy_hours_id_foreign` (`happy_hours_id`);

--
-- Indexes for table `ha_translations`
--
ALTER TABLE `ha_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hot_offers`
--
ALTER TABLE `hot_offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `in_app_messages`
--
ALTER TABLE `in_app_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_builders`
--
ALTER TABLE `menu_builders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_builder_roles`
--
ALTER TABLE `menu_builder_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_builder_roles_menu_builder_id_foreign` (`menu_builder_id`),
  ADD KEY `menu_builder_roles_parent_id_foreign` (`parent_id`),
  ADD KEY `menu_builder_roles_role_id_foreign` (`role_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_conversation_id_foreign` (`conversation_id`),
  ADD KEY `messages_sender_id_foreign` (`sender_id`),
  ADD KEY `messages_receiver_id_foreign` (`receiver_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mobile_widgets`
--
ALTER TABLE `mobile_widgets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_do_not_has_permissions`
--
ALTER TABLE `model_do_not_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notes_notable_type_notable_id_index` (`notable_type`,`notable_id`),
  ADD KEY `notes_created_by_user_id_foreign` (`created_by_user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`),
  ADD KEY `notifications_notification_type_id_foreign` (`notification_type_id`),
  ADD KEY `notifications_section_foreign` (`section`),
  ADD KEY `notifications_store_foreign` (`store`),
  ADD KEY `notifications_navstore_foreign` (`navstore`),
  ADD KEY `notifications_navfood_foreign` (`navfood`),
  ADD KEY `notifications_id_index` (`id`);

--
-- Indexes for table `notification_seen`
--
ALTER TABLE `notification_seen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_seen_user_id_foreign` (`user_id`),
  ADD KEY `notification_seen_notification_id_foreign` (`notification_id`);

--
-- Indexes for table `notification_sents`
--
ALTER TABLE `notification_sents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_sents_created_by_user_id_foreign` (`created_by_user_id`),
  ADD KEY `notification_sents_notification_id_foreign` (`notification_id`);

--
-- Indexes for table `notification_sent_user`
--
ALTER TABLE `notification_sent_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_sent_user_user_id_foreign` (`user_id`),
  ADD KEY `notification_sent_user_notification_sent_id_foreign` (`notification_sent_id`);

--
-- Indexes for table `notification_times`
--
ALTER TABLE `notification_times`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_times_notification_id_foreign` (`notification_id`);

--
-- Indexes for table `notification_types`
--
ALTER TABLE `notification_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_type_options`
--
ALTER TABLE `notification_type_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_type_options_notification_id_foreign` (`notification_id`);

--
-- Indexes for table `nutrition`
--
ALTER TABLE `nutrition`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nutrition_food_id_foreign` (`food_id`),
  ADD KEY `nutrition_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offer_conditions`
--
ALTER TABLE `offer_conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_order_status_id_foreign` (`order_status_id`),
  ADD KEY `orders_driver_id_foreign` (`driver_id`),
  ADD KEY `orders_delivery_address_id_foreign` (`delivery_address_id`),
  ADD KEY `orders_branch_id_foreign` (`branch_id`),
  ADD KEY `orders_coupon_id_foreign` (`coupon_id`),
  ADD KEY `orders_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `orders_cancelled_by_foreign` (`cancelled_by`),
  ADD KEY `orders_wallet_transaction_id_foreign` (`wallet_transaction_id`),
  ADD KEY `orders_cancellation_reason_id_foreign` (`cancellation_reason_id`),
  ADD KEY `orders_assigned_to_user_id_foreign` (`assigned_to_user_id`),
  ADD KEY `orders_order_delivery_address_id_foreign` (`order_delivery_address_id`),
  ADD KEY `orders_compensation_transaction_id_foreign` (`compensation_transaction_id`),
  ADD KEY `orders_order_delivery_fee_calculations_id_foreign` (`order_delivery_fee_calculations_id`),
  ADD KEY `orders_assigned_how_user_id_foreign` (`assigned_how_user_id`),
  ADD KEY `orders_compensation_coupon_id_foreign` (`compensation_coupon_id`),
  ADD KEY `orders_code_index` (`code`);

--
-- Indexes for table `order_delivery_address`
--
ALTER TABLE `order_delivery_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_delivery_address_user_id_foreign` (`user_id`),
  ADD KEY `order_delivery_address_zone_id_foreign` (`zone_id`);

--
-- Indexes for table `order_delivery_fee_calculations`
--
ALTER TABLE `order_delivery_fee_calculations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_discounts`
--
ALTER TABLE `order_discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_discounts_order_id_foreign` (`order_id`);

--
-- Indexes for table `order_history`
--
ALTER TABLE `order_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_history_order_delivery_address_id_foreign` (`order_delivery_address_id`),
  ADD KEY `order_history_order_delivery_fee_calculations_id_foreign` (`order_delivery_fee_calculations_id`),
  ADD KEY `order_history_cancellation_reason_id_foreign` (`cancellation_reason_id`),
  ADD KEY `order_history_order_id_foreign` (`order_id`),
  ADD KEY `order_history_user_id_foreign` (`user_id`),
  ADD KEY `order_history_order_status_id_foreign` (`order_status_id`),
  ADD KEY `order_history_driver_id_foreign` (`driver_id`),
  ADD KEY `order_history_delivery_address_id_foreign` (`delivery_address_id`),
  ADD KEY `order_history_branch_id_foreign` (`branch_id`),
  ADD KEY `order_history_coupon_id_foreign` (`coupon_id`),
  ADD KEY `order_history_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `order_history_cancelled_by_foreign` (`cancelled_by`),
  ADD KEY `order_history_wallet_transaction_id_foreign` (`wallet_transaction_id`),
  ADD KEY `order_history_assigned_to_user_id_foreign` (`assigned_to_user_id`),
  ADD KEY `order_history_compensation_transaction_id_foreign` (`compensation_transaction_id`),
  ADD KEY `order_history_assigned_how_user_id_foreign` (`assigned_how_user_id`);

--
-- Indexes for table `order_info`
--
ALTER TABLE `order_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_log`
--
ALTER TABLE `order_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_log_order_id_foreign` (`order_id`),
  ADD KEY `order_log_created_by_user_id_foreign` (`created_by_user_id`),
  ADD KEY `order_log_status_id_foreign` (`status_id`);

--
-- Indexes for table `order_rejections`
--
ALTER TABLE `order_rejections`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `order_rejections_cancellation_reason_id_foreign` (`cancellation_reason_id`),
  ADD KEY `order_rejections_rejected_by_foreign` (`rejected_by`),
  ADD KEY `order_rejections_confirmed_by_foreign` (`confirmed_by`);

--
-- Indexes for table `order_statuses`
--
ALTER TABLE `order_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_update_infos`
--
ALTER TABLE `order_update_infos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_update_infos_order_id_foreign` (`order_id`),
  ADD KEY `order_update_infos_created_by_user_id_foreign` (`created_by_user_id`);

--
-- Indexes for table `otps`
--
ALTER TABLE `otps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages_log`
--
ALTER TABLE `packages_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `packages_log_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `packages_log_package_id_foreign` (`package_id`),
  ADD KEY `packages_log_end_by_foreign` (`end_by`);

--
-- Indexes for table `package_fees`
--
ALTER TABLE `package_fees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_fees_package_id_foreign` (`package_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`),
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_user_id_foreign` (`user_id`),
  ADD KEY `payments_status_index` (`status`),
  ADD KEY `payments_method_index` (`method`),
  ADD KEY `payments_payable_type_payable_id_index` (`payable_type`,`payable_id`);

--
-- Indexes for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_details_payment_id_foreign` (`payment_id`);

--
-- Indexes for table `payment_log`
--
ALTER TABLE `payment_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_log_payment_id_foreign` (`payment_id`);

--
-- Indexes for table `pending_orders`
--
ALTER TABLE `pending_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pending_orders_order_delivery_address_id_foreign` (`order_delivery_address_id`),
  ADD KEY `pending_orders_order_delivery_fee_calculations_id_foreign` (`order_delivery_fee_calculations_id`),
  ADD KEY `pending_orders_cancellation_reason_id_foreign` (`cancellation_reason_id`),
  ADD KEY `pending_orders_user_id_foreign` (`user_id`),
  ADD KEY `pending_orders_order_status_id_foreign` (`order_status_id`),
  ADD KEY `pending_orders_driver_id_foreign` (`driver_id`),
  ADD KEY `pending_orders_delivery_address_id_foreign` (`delivery_address_id`),
  ADD KEY `pending_orders_branch_id_foreign` (`branch_id`),
  ADD KEY `pending_orders_coupon_id_foreign` (`coupon_id`),
  ADD KEY `pending_orders_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `pending_orders_cancelled_by_foreign` (`cancelled_by`),
  ADD KEY `pending_orders_wallet_transaction_id_foreign` (`wallet_transaction_id`),
  ADD KEY `pending_orders_assigned_to_user_id_foreign` (`assigned_to_user_id`),
  ADD KEY `pending_orders_compensation_transaction_id_foreign` (`compensation_transaction_id`),
  ADD KEY `pending_orders_assigned_how_user_id_foreign` (`assigned_how_user_id`);

--
-- Indexes for table `pending_order_discounts`
--
ALTER TABLE `pending_order_discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pending_order_discounts_pending_order_id_foreign` (`pending_order_id`);

--
-- Indexes for table `pending_order_foods`
--
ALTER TABLE `pending_order_foods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pending_order_foods_food_id_foreign` (`food_id`),
  ADD KEY `pending_order_foods_pending_order_id_foreign` (`pending_order_id`),
  ADD KEY `pending_order_foods_size_id_foreign` (`size_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`),
  ADD KEY `permissions_group_id_foreign` (`group_id`);

--
-- Indexes for table `permission_group`
--
ALTER TABLE `permission_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `phone_verify_logs`
--
ALTER TABLE `phone_verify_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `photos_user_id_foreign` (`user_id`);

--
-- Indexes for table `policies`
--
ALTER TABLE `policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `policy_roles`
--
ALTER TABLE `policy_roles`
  ADD PRIMARY KEY (`policy_id`,`role_id`),
  ADD KEY `policy_roles_policy_id_foreign` (`policy_id`),
  ADD KEY `policy_roles_role_id_foreign` (`role_id`);

--
-- Indexes for table `popups`
--
ALTER TABLE `popups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `popups_section_id_foreign` (`section_id`),
  ADD KEY `popups_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `popups_food_id_foreign` (`food_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `preferences`
--
ALTER TABLE `preferences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `preferences_preferences_group_id_foreign` (`preferences_group_id`),
  ADD KEY `preferences_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `preferences_group`
--
ALTER TABLE `preferences_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `preferences_group_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `preferences_size`
--
ALTER TABLE `preferences_size`
  ADD PRIMARY KEY (`preferences_id`,`size_id`),
  ADD KEY `preferences_size_preferences_id_foreign` (`preferences_id`),
  ADD KEY `preferences_size_size_id_foreign` (`size_id`);

--
-- Indexes for table `preferred_sections`
--
ALTER TABLE `preferred_sections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `preferred_sections_name_unique` (`name`);

--
-- Indexes for table `ragions`
--
ALTER TABLE `ragions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `referrals_code_user_id_unique` (`code`,`user_id`),
  ADD KEY `referrals_user_id_foreign` (`user_id`);

--
-- Indexes for table `referral_users`
--
ALTER TABLE `referral_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `referral_users_referral_id_user_id_unique` (`referral_id`,`user_id`),
  ADD KEY `referral_users_referral_id_foreign` (`referral_id`),
  ADD KEY `referral_users_user_id_foreign` (`user_id`),
  ADD KEY `referral_users_coupon_id_foreign` (`coupon_id`);

--
-- Indexes for table `reset_code_passwords`
--
ALTER TABLE `reset_code_passwords`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reset_code_passwords_email_index` (`email`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurants_sector_id_foreign` (`sector_id`),
  ADD KEY `restaurants_restaurant_status_id_foreign` (`restaurant_status_id`),
  ADD KEY `restaurants_restaurant_group_id_foreign` (`restaurant_group_id`),
  ADD KEY `restaurants_restaurant_inactive_reason_id_foreign` (`restaurant_inactive_reason_id`),
  ADD KEY `restaurants_who_terminated_user_id_foreign` (`who_terminated_user_id`);

--
-- Indexes for table `restaurants_payouts`
--
ALTER TABLE `restaurants_payouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurants_payouts_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `restaurant_conversations`
--
ALTER TABLE `restaurant_conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_conversations_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `restaurant_conversations_user_id_foreign` (`user_id`);

--
-- Indexes for table `restaurant_cuisines`
--
ALTER TABLE `restaurant_cuisines`
  ADD PRIMARY KEY (`restaurant_id`,`cuisine_id`),
  ADD KEY `restaurant_cuisines_cuisine_id_foreign` (`cuisine_id`),
  ADD KEY `restaurant_cuisines_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `restaurant_custom_delivery_fees`
--
ALTER TABLE `restaurant_custom_delivery_fees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_custom_delivery_fees_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `restaurant_custom_delivery_fees_delivery_vehicle_id_foreign` (`delivery_vehicle_id`),
  ADD KEY `restaurant_custom_delivery_fees_zone_id_foreign` (`zone_id`);

--
-- Indexes for table `restaurant_excluded_zones`
--
ALTER TABLE `restaurant_excluded_zones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_excluded_zones_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `restaurant_excluded_zones_zone_id_foreign` (`zone_id`);

--
-- Indexes for table `restaurant_groups`
--
ALTER TABLE `restaurant_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant_inactive_reasons`
--
ALTER TABLE `restaurant_inactive_reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant_requests`
--
ALTER TABLE `restaurant_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_requests_city_id_foreign` (`city_id`),
  ADD KEY `restaurant_requests_zone_id_foreign` (`zone_id`),
  ADD KEY `restaurant_requests_sector_id_foreign` (`sector_id`),
  ADD KEY `restaurant_requests_user_id_foreign` (`user_id`);

--
-- Indexes for table `restaurant_reviews`
--
ALTER TABLE `restaurant_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_reviews_user_id_foreign` (`user_id`),
  ADD KEY `restaurant_reviews_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `restaurant_reviews_order_id_foreign` (`order_id`);

--
-- Indexes for table `restaurant_sector`
--
ALTER TABLE `restaurant_sector`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_sector_sector_id_foreign` (`sector_id`),
  ADD KEY `restaurant_sector_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `restaurant_slides`
--
ALTER TABLE `restaurant_slides`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_slides_food_id_foreign` (`food_id`),
  ADD KEY `restaurant_slides_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `restaurant_status`
--
ALTER TABLE `restaurant_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant_types`
--
ALTER TABLE `restaurant_types`
  ADD KEY `restaurant_types_type_id_foreign` (`type_id`),
  ADD KEY `restaurant_types_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `restaurant_zone_delivery_fees`
--
ALTER TABLE `restaurant_zone_delivery_fees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_zone_delivery_fees_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `restaurant_zone_delivery_fees_zone_id_foreign` (`zone_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sectors`
--
ALTER TABLE `sectors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sizes_size_group_id_foreign` (`size_group_id`),
  ADD KEY `sizes_food_id_foreign` (`food_id`),
  ADD KEY `sizes_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `size_group`
--
ALTER TABLE `size_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `size_group_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `status_reasons`
--
ALTER TABLE `status_reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `term_roles`
--
ALTER TABLE `term_roles`
  ADD KEY `term_roles_term_id_foreign` (`term_id`),
  ADD KEY `term_roles_role_id_foreign` (`role_id`);

--
-- Indexes for table `total_zones`
--
ALTER TABLE `total_zones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_user_status_id_foreign` (`user_status_id`);

--
-- Indexes for table `user_branches`
--
ALTER TABLE `user_branches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_branches_user_id_foreign` (`user_id`),
  ADD KEY `user_branches_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `user_cities`
--
ALTER TABLE `user_cities`
  ADD PRIMARY KEY (`user_id`,`city_id`),
  ADD KEY `user_cities_user_id_foreign` (`user_id`),
  ADD KEY `user_cities_city_id_foreign` (`city_id`);

--
-- Indexes for table `user_coupons`
--
ALTER TABLE `user_coupons`
  ADD KEY `user_coupons_user_id_foreign` (`user_id`),
  ADD KEY `user_coupons_coupon_id_foreign` (`coupon_id`);

--
-- Indexes for table `user_restaurants`
--
ALTER TABLE `user_restaurants`
  ADD PRIMARY KEY (`user_id`,`restaurant_id`),
  ADD KEY `user_restaurants_user_id_foreign` (`user_id`),
  ADD KEY `user_restaurants_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `user_restaurant_groups`
--
ALTER TABLE `user_restaurant_groups`
  ADD PRIMARY KEY (`user_id`,`restaurant_group_id`),
  ADD KEY `user_restaurant_groups_user_id_foreign` (`user_id`),
  ADD KEY `user_restaurant_groups_restaurant_group_id_foreign` (`restaurant_group_id`);

--
-- Indexes for table `user_status`
--
ALTER TABLE `user_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_vendors`
--
ALTER TABLE `user_vendors`
  ADD PRIMARY KEY (`user_id`,`restaurant_id`),
  ADD KEY `user_vendors_user_id_foreign` (`user_id`),
  ADD KEY `user_vendors_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `user_zones`
--
ALTER TABLE `user_zones`
  ADD PRIMARY KEY (`user_id`,`zone_id`),
  ADD KEY `user_zones_user_id_foreign` (`user_id`),
  ADD KEY `user_zones_zone_id_foreign` (`zone_id`);

--
-- Indexes for table `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visits_user_id_foreign` (`user_id`),
  ADD KEY `visits_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wallets_user_id_unique` (`user_id`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallet_transactions_user_id_foreign` (`user_id`),
  ADD KEY `wallet_transactions_wallet_id_foreign` (`wallet_id`),
  ADD KEY `wallet_transactions_created_by_foreign` (`created_by`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zones_city_id_foreign` (`city_id`),
  ADD KEY `zones_area_id_foreign` (`area_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assist_drivers`
--
ALTER TABLE `assist_drivers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audience_coupon_user`
--
ALTER TABLE `audience_coupon_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `balances`
--
ALTER TABLE `balances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `balance_transactions`
--
ALTER TABLE `balance_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_inactive_times`
--
ALTER TABLE `booking_inactive_times`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_status`
--
ALTER TABLE `booking_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookmarks`
--
ALTER TABLE `bookmarks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branch_rush_days`
--
ALTER TABLE `branch_rush_days`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branch_sessions`
--
ALTER TABLE `branch_sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branch_statistics`
--
ALTER TABLE `branch_statistics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `camera_requests`
--
ALTER TABLE `camera_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cancellation_reasons`
--
ALTER TABLE `cancellation_reasons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cancellation_reason_role`
--
ALTER TABLE `cancellation_reason_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `captain_providers`
--
ALTER TABLE `captain_providers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `captain_provider_zones`
--
ALTER TABLE `captain_provider_zones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `career_faqs`
--
ALTER TABLE `career_faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `career_positions`
--
ALTER TABLE `career_positions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `career_sliders`
--
ALTER TABLE `career_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `career_teams`
--
ALTER TABLE `career_teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `career_videos`
--
ALTER TABLE `career_videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_foods`
--
ALTER TABLE `cart_foods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clubs`
--
ALTER TABLE `clubs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `collection_banners`
--
ALTER TABLE `collection_banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `collection_banner_items`
--
ALTER TABLE `collection_banner_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `compensation`
--
ALTER TABLE `compensation`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `compensation_conditions`
--
ALTER TABLE `compensation_conditions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `compensation_role`
--
ALTER TABLE `compensation_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complaint_actions`
--
ALTER TABLE `complaint_actions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_person`
--
ALTER TABLE `contact_person`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupon_campaign_targets`
--
ALTER TABLE `coupon_campaign_targets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupon_requests`
--
ALTER TABLE `coupon_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupon_times`
--
ALTER TABLE `coupon_times`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cuisines`
--
ALTER TABLE `cuisines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deep_link_short_codes`
--
ALTER TABLE `deep_link_short_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_addresses`
--
ALTER TABLE `delivery_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_vehicles`
--
ALTER TABLE `delivery_vehicles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discountables`
--
ALTER TABLE `discountables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dispatching`
--
ALTER TABLE `dispatching`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `drivers_fee`
--
ALTER TABLE `drivers_fee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `drivers_payouts`
--
ALTER TABLE `drivers_payouts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver_arrivals`
--
ALTER TABLE `driver_arrivals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver_captured_images`
--
ALTER TABLE `driver_captured_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver_cash_requests`
--
ALTER TABLE `driver_cash_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver_day_offs`
--
ALTER TABLE `driver_day_offs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver_live_location_histories`
--
ALTER TABLE `driver_live_location_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver_order_notification`
--
ALTER TABLE `driver_order_notification`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver_penalties`
--
ALTER TABLE `driver_penalties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver_requests`
--
ALTER TABLE `driver_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver_reviews`
--
ALTER TABLE `driver_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver_sessions`
--
ALTER TABLE `driver_sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver_shifts`
--
ALTER TABLE `driver_shifts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver_shift_user`
--
ALTER TABLE `driver_shift_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver_statistics`
--
ALTER TABLE `driver_statistics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver_zones`
--
ALTER TABLE `driver_zones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_verify_tokens`
--
ALTER TABLE `email_verify_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_wallets`
--
ALTER TABLE `employee_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_wallet_transactions`
--
ALTER TABLE `employee_wallet_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `evaluations`
--
ALTER TABLE `evaluations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `explore_menu`
--
ALTER TABLE `explore_menu`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extras`
--
ALTER TABLE `extras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extra_groups`
--
ALTER TABLE `extra_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faq_categories`
--
ALTER TABLE `faq_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `first_time_passwords`
--
ALTER TABLE `first_time_passwords`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `foods`
--
ALTER TABLE `foods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `food_offer_condition`
--
ALTER TABLE `food_offer_condition`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `food_orders`
--
ALTER TABLE `food_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `food_orders_history`
--
ALTER TABLE `food_orders_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `food_reviews`
--
ALTER TABLE `food_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `google_directions_distances`
--
ALTER TABLE `google_directions_distances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `happy_hours`
--
ALTER TABLE `happy_hours`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `happy_hour_restaurant`
--
ALTER TABLE `happy_hour_restaurant`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ha_translations`
--
ALTER TABLE `ha_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hot_offers`
--
ALTER TABLE `hot_offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `in_app_messages`
--
ALTER TABLE `in_app_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu_builders`
--
ALTER TABLE `menu_builders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu_builder_roles`
--
ALTER TABLE `menu_builder_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mobile_widgets`
--
ALTER TABLE `mobile_widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_seen`
--
ALTER TABLE `notification_seen`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_sents`
--
ALTER TABLE `notification_sents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_sent_user`
--
ALTER TABLE `notification_sent_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_times`
--
ALTER TABLE `notification_times`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_types`
--
ALTER TABLE `notification_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_type_options`
--
ALTER TABLE `notification_type_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nutrition`
--
ALTER TABLE `nutrition`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offer_conditions`
--
ALTER TABLE `offer_conditions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_delivery_address`
--
ALTER TABLE `order_delivery_address`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_delivery_fee_calculations`
--
ALTER TABLE `order_delivery_fee_calculations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_discounts`
--
ALTER TABLE `order_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_history`
--
ALTER TABLE `order_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_info`
--
ALTER TABLE `order_info`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_log`
--
ALTER TABLE `order_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_statuses`
--
ALTER TABLE `order_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_update_infos`
--
ALTER TABLE `order_update_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `otps`
--
ALTER TABLE `otps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packages_log`
--
ALTER TABLE `packages_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `package_fees`
--
ALTER TABLE `package_fees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_details`
--
ALTER TABLE `payment_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_log`
--
ALTER TABLE `payment_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pending_orders`
--
ALTER TABLE `pending_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pending_order_discounts`
--
ALTER TABLE `pending_order_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pending_order_foods`
--
ALTER TABLE `pending_order_foods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permission_group`
--
ALTER TABLE `permission_group`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_verify_logs`
--
ALTER TABLE `phone_verify_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `policies`
--
ALTER TABLE `policies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `popups`
--
ALTER TABLE `popups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `preferences`
--
ALTER TABLE `preferences`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `preferences_group`
--
ALTER TABLE `preferences_group`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `preferred_sections`
--
ALTER TABLE `preferred_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ragions`
--
ALTER TABLE `ragions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referral_users`
--
ALTER TABLE `referral_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reset_code_passwords`
--
ALTER TABLE `reset_code_passwords`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurants_payouts`
--
ALTER TABLE `restaurants_payouts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurant_conversations`
--
ALTER TABLE `restaurant_conversations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurant_custom_delivery_fees`
--
ALTER TABLE `restaurant_custom_delivery_fees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurant_excluded_zones`
--
ALTER TABLE `restaurant_excluded_zones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurant_groups`
--
ALTER TABLE `restaurant_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurant_inactive_reasons`
--
ALTER TABLE `restaurant_inactive_reasons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurant_requests`
--
ALTER TABLE `restaurant_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurant_reviews`
--
ALTER TABLE `restaurant_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurant_sector`
--
ALTER TABLE `restaurant_sector`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurant_slides`
--
ALTER TABLE `restaurant_slides`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurant_status`
--
ALTER TABLE `restaurant_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurant_zone_delivery_fees`
--
ALTER TABLE `restaurant_zone_delivery_fees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sectors`
--
ALTER TABLE `sectors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `size_group`
--
ALTER TABLE `size_group`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `status_reasons`
--
ALTER TABLE `status_reasons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `total_zones`
--
ALTER TABLE `total_zones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_branches`
--
ALTER TABLE `user_branches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_status`
--
ALTER TABLE `user_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visits`
--
ALTER TABLE `visits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------

--
-- Structure for view `bookings_earnings_per_day`
--
DROP TABLE IF EXISTS `bookings_earnings_per_day`;

CREATE ALGORITHM=UNDEFINED DEFINER=`backend`@`localhost` SQL SECURITY DEFINER VIEW `bookings_earnings_per_day`  AS SELECT `b`.`id` AS `booking_id`, `b`.`branch_id` AS `branch_id`, `b`.`restaurant_id` AS `restaurant_id`, cast(`b`.`date` as date) AS `day`, `b`.`status_id` AS `status_id`, coalesce(sum(`b`.`app_amount`),0) AS `total` FROM `bookings` AS `b` GROUP BY `b`.`id`, `b`.`branch_id`, `b`.`restaurant_id`, `b`.`status_id`, cast(`b`.`date` as date) ORDER BY `b`.`id` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `branch_statistics_per_day`
--
DROP TABLE IF EXISTS `branch_statistics_per_day`;

CREATE ALGORITHM=UNDEFINED DEFINER=`backend`@`localhost` SQL SECURITY DEFINER VIEW `branch_statistics_per_day`  AS SELECT `b`.`branch_id` AS `branch_id`, `b`.`restaurant_id` AS `restaurant_id`, `b`.`day` AS `day`, `b`.`status_id` AS `status_id`, sum(timestampdiff(MINUTE,`b`.`start_at`,`b`.`end_at`)) AS `avg_time` FROM `branch_sessions` AS `b` GROUP BY `b`.`branch_id`, `b`.`restaurant_id`, `b`.`status_id`, `b`.`day` ORDER BY `b`.`branch_id` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `driver_assist_earnings_per_day`
--
DROP TABLE IF EXISTS `driver_assist_earnings_per_day`;

CREATE ALGORITHM=UNDEFINED DEFINER=`backend`@`localhost` SQL SECURITY DEFINER VIEW `driver_assist_earnings_per_day`  AS SELECT `ad`.`driver_id` AS `driver_id`, cast(`o`.`created_at` as date) AS `day`, `o`.`id` AS `order_id`, `o`.`order_status_id` AS `status_id`, `o`.`driver_fee` AS `captain`, `o`.`delivery_fee` AS `order_delivery`, `p`.`status` AS `payment_status`, `p`.`method` AS `payment_method` FROM ((`assist_drivers` `ad` join `orders` `o` on(`o`.`id` = `ad`.`order_id`)) join `payments` `p` on(`p`.`payable_id` = `o`.`id`)) WHERE `ad`.`driver_id` is not null AND `p`.`payable_type` = 'App\\Models\\Order' GROUP BY `ad`.`driver_id`, cast(`o`.`created_at` as date), `o`.`id`, `o`.`order_status_id`, `o`.`driver_fee`, `o`.`delivery_fee`, `p`.`status`, `p`.`method` ORDER BY `ad`.`driver_id` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `driver_earnings_per_day`
--
DROP TABLE IF EXISTS `driver_earnings_per_day`;

CREATE ALGORITHM=UNDEFINED DEFINER=`backend`@`localhost` SQL SECURITY DEFINER VIEW `driver_earnings_per_day`  AS SELECT `d`.`id` AS `driver_id`, cast(`o`.`created_at` as date) AS `day`, `o`.`id` AS `order_id`, `o`.`order_status_id` AS `status_id`, `o`.`driver_fee` AS `captain`, `o`.`delivery_fee` AS `order_delivery`, sum(`p`.`price`) AS `payment_total`, `p`.`status` AS `payment_status`, `p`.`method` AS `payment_method`, sum(`oi`.`driver_paid` - `oi`.`driver_collected`) AS `captain_get` FROM ((((`orders` `o` left join (select `food_orders`.`order_id` AS `order_id`,sum(`food_orders`.`total`) AS `total` from `food_orders` group by `food_orders`.`order_id`) `fo` on(`fo`.`order_id` = `o`.`id`)) join `payments` `p` on(`p`.`payable_id` = `o`.`id`)) join `drivers` `d` on(`d`.`user_id` = `o`.`driver_id`)) join `order_info` `oi` on(`o`.`id` = `oi`.`order_id`)) WHERE `d`.`id` is not null AND `p`.`payable_type` = 'App\\Models\\Order' GROUP BY `d`.`id`, cast(`o`.`created_at` as date), `o`.`id`, `o`.`order_status_id`, `o`.`driver_fee`, `o`.`delivery_fee`, `p`.`method`, `p`.`status`, `o`.`pay_on_spot`, `o`.`is_restaurant_partner` ORDER BY `d`.`id` ASC, cast(`o`.`created_at` as date) ASC ;

-- --------------------------------------------------------

--
-- Structure for view `driver_finished_orders_per_day`
--
DROP TABLE IF EXISTS `driver_finished_orders_per_day`;

CREATE ALGORITHM=UNDEFINED DEFINER=`backend`@`localhost` SQL SECURITY DEFINER VIEW `driver_finished_orders_per_day`  AS SELECT `orders`.`driver_id` AS `driver_id`, cast(`orders`.`finished_at` as date) AS `day`, count(`orders`.`id`) AS `order_count`, sum(timestampdiff(SECOND,`orders`.`created_at`,`orders`.`accept_at`)) AS `accepttime`, sum(timestampdiff(SECOND,`orders`.`accept_at`,`orders`.`finished_at`)) AS `deliverytime`, sum(`orders`.`approximate_distance`) * 3600 / sum(timestampdiff(SECOND,`orders`.`accept_at`,`orders`.`finished_at`)) AS `speed` FROM `orders` WHERE `orders`.`finished_at` is not null AND `orders`.`order_status_id` = 5 GROUP BY `orders`.`driver_id`, cast(`orders`.`finished_at` as date) ORDER BY `orders`.`driver_id` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `driver_lost_work_time_per_day`
--
DROP TABLE IF EXISTS `driver_lost_work_time_per_day`;

CREATE ALGORITHM=UNDEFINED DEFINER=`backend`@`localhost` SQL SECURITY DEFINER VIEW `driver_lost_work_time_per_day`  AS SELECT `driver_sessions`.`driver_id` AS `driver_id`, cast(`driver_sessions`.`start_at` as date) AS `day`, sum(timestampdiff(SECOND,`driver_sessions`.`start_at`,`driver_sessions`.`end_at`)) AS `duration_in_seconds` FROM `driver_sessions` WHERE `driver_sessions`.`status_id` = 1 GROUP BY `driver_sessions`.`driver_id`, cast(`driver_sessions`.`start_at` as date) ORDER BY `driver_sessions`.`driver_id` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `driver_rate`
--
DROP TABLE IF EXISTS `driver_rate`;

CREATE ALGORITHM=UNDEFINED DEFINER=`backend`@`localhost` SQL SECURITY DEFINER VIEW `driver_rate`  AS SELECT `driver_reviews`.`driver_id` AS `driver_id`, avg(`driver_reviews`.`rate`) AS `rate` FROM `driver_reviews` GROUP BY `driver_reviews`.`driver_id` ;

-- --------------------------------------------------------

--
-- Structure for view `driver_real_work_time_per_day`
--
DROP TABLE IF EXISTS `driver_real_work_time_per_day`;

CREATE ALGORITHM=UNDEFINED DEFINER=`backend`@`localhost` SQL SECURITY DEFINER VIEW `driver_real_work_time_per_day`  AS SELECT `driver_sessions`.`driver_id` AS `driver_id`, cast(`driver_sessions`.`start_at` as date) AS `day`, sum(timestampdiff(SECOND,`driver_sessions`.`start_at`,`driver_sessions`.`end_at`)) AS `duration_in_seconds` FROM `driver_sessions` WHERE `driver_sessions`.`status_id` = 2 GROUP BY `driver_sessions`.`driver_id`, cast(`driver_sessions`.`start_at` as date) ORDER BY `driver_sessions`.`driver_id` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `driver_worked_hours_per_day`
--
DROP TABLE IF EXISTS `driver_worked_hours_per_day`;

CREATE ALGORITHM=UNDEFINED DEFINER=`backend`@`localhost` SQL SECURITY DEFINER VIEW `driver_worked_hours_per_day`  AS SELECT `driver_sessions`.`driver_id` AS `driver_id`, cast(`driver_sessions`.`start_at` as date) AS `day`, sum(timestampdiff(SECOND,`driver_sessions`.`start_at`,`driver_sessions`.`end_at`)) AS `duration_in_seconds` FROM `driver_sessions` WHERE `driver_sessions`.`status_id` < 3 GROUP BY `driver_sessions`.`driver_id`, cast(`driver_sessions`.`start_at` as date) ORDER BY `driver_sessions`.`driver_id` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `food_rate`
--
DROP TABLE IF EXISTS `food_rate`;

CREATE ALGORITHM=UNDEFINED DEFINER=`backend`@`localhost` SQL SECURITY DEFINER VIEW `food_rate`  AS SELECT `food_reviews`.`food_id` AS `food_id`, avg(`food_reviews`.`rate`) AS `rate`, count(`food_reviews`.`id`) AS `total` FROM `food_reviews` GROUP BY `food_reviews`.`food_id` ;

-- --------------------------------------------------------

--
-- Structure for view `order_earnings_per_day`
--
DROP TABLE IF EXISTS `order_earnings_per_day`;

CREATE ALGORITHM=UNDEFINED DEFINER=`backend`@`localhost` SQL SECURITY DEFINER VIEW `order_earnings_per_day`  AS SELECT `o`.`id` AS `order_id`, `o`.`branch_id` AS `branch_id`, `o`.`restaurant_id` AS `restaurant_id`, cast(`o`.`created_at` as date) AS `day`, `o`.`order_status_id` AS `status_id`, coalesce((select sum(`food_orders`.`total`) from `food_orders` where `food_orders`.`order_id` = `o`.`id`),0) AS `total`, coalesce(`o`.`commission_with_tax`,0) AS `app`, coalesce(`o`.`commission_tax`,0) AS `app_commission_tax`, coalesce((select sum(`food_orders`.`total`) from `food_orders` where `food_orders`.`order_id` = `o`.`id`) - `o`.`commission_with_tax`,0) AS `store`, coalesce(sum((select sum(`food_orders`.`total`) from `food_orders` where `food_orders`.`order_id` = `o`.`id`) * `o`.`service_fee` / 100),0) AS `service_fee`, coalesce((select sum(`food_orders`.`app_discount_price` * `food_orders`.`quantity`) from `food_orders` where `food_orders`.`order_id` = `o`.`id`),0) AS `app_food_discounts`, coalesce((select sum(`order_discounts`.`value`) from `order_discounts` where `order_discounts`.`order_id` = `o`.`id`),0) AS `total_discounts`, coalesce((select sum(`order_discounts`.`value` * `order_discounts`.`app_percentage` / 100) from `order_discounts` where `order_discounts`.`order_id` = `o`.`id`),0) AS `app_discounts`, coalesce((select sum(`order_discounts`.`value` * `order_discounts`.`store_percentage` / 100) from `order_discounts` where `order_discounts`.`order_id` = `o`.`id`),0) AS `store_discounts`, coalesce(sum(`o`.`delivery_fee`),0) AS `delivery_fee`, if(`o`.`app_deliver` = 1,coalesce(sum(`o`.`delivery_fee`),0),0) AS `app_delivery_fee`, if(`o`.`app_deliver` = 1,0,coalesce(sum(`o`.`delivery_fee`),0)) AS `store_delivery_fee`, coalesce(sum(`o`.`app_cancellation_fees`),0) AS `app_cancellation_fees`, coalesce(sum(`o`.`store_cancellation_fees`),0) AS `store_cancellation_fees`, (select count(`cancellation_reasons`.`id`) from `cancellation_reasons` where `cancellation_reasons`.`id` = `o`.`cancellation_reason_id` and `cancellation_reasons`.`app_cost_percentage` = 50 and `cancellation_reasons`.`restaurant_cost_percentage` = 50) AS `is_cancel_50_50` FROM `orders` AS `o` GROUP BY `o`.`id`, `o`.`branch_id`, `o`.`restaurant_id`, `o`.`app_deliver`, `o`.`commission_tax`, `o`.`commission_with_tax`, `o`.`order_status_id`, `o`.`cancellation_reason_id`, cast(`o`.`created_at` as date) ORDER BY `o`.`id` ASC ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `areas`
--
ALTER TABLE `areas`
  ADD CONSTRAINT `areas_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `assist_drivers`
--
ALTER TABLE `assist_drivers`
  ADD CONSTRAINT `assist_drivers_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assist_drivers_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `audience_coupon_user`
--
ALTER TABLE `audience_coupon_user`
  ADD CONSTRAINT `audience_coupon_user_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `audience_coupon_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `balances`
--
ALTER TABLE `balances`
  ADD CONSTRAINT `balances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `balance_transactions`
--
ALTER TABLE `balance_transactions`
  ADD CONSTRAINT `balance_transactions_balance_id_foreign` FOREIGN KEY (`balance_id`) REFERENCES `balances` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `balance_transactions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `balance_transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `balance_transactions_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `balance_transactions_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `balance_transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bookings_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bookings_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `booking_status` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD CONSTRAINT `followup_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `branches_branch_status_id_foreign` FOREIGN KEY (`branch_status_id`) REFERENCES `restaurant_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `branches_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `branches_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `branches_restaurant_inactive_reason_id_foreign` FOREIGN KEY (`restaurant_inactive_reason_id`) REFERENCES `restaurant_inactive_reasons` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `branches_zone_id_foreign` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `branch_rush_days`
--
ALTER TABLE `branch_rush_days`
  ADD CONSTRAINT `branch_rush_days_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `branch_sessions`
--
ALTER TABLE `branch_sessions`
  ADD CONSTRAINT `branch_sessions_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `branch_sessions_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `branch_sessions_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `restaurant_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `branch_statistics`
--
ALTER TABLE `branch_statistics`
  ADD CONSTRAINT `branch_statistics_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `branch_statistics_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `camera_requests`
--
ALTER TABLE `camera_requests`
  ADD CONSTRAINT `camera_requests_driver_captured_image_id_foreign` FOREIGN KEY (`driver_captured_image_id`) REFERENCES `driver_captured_images` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `camera_requests_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cancellation_reason_role`
--
ALTER TABLE `cancellation_reason_role`
  ADD CONSTRAINT `cancellation_reason_role_cancellation_reason_id_foreign` FOREIGN KEY (`cancellation_reason_id`) REFERENCES `cancellation_reasons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cancellation_reason_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `captain_providers`
--
ALTER TABLE `captain_providers`
  ADD CONSTRAINT `captain_providers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `captain_provider_zones`
--
ALTER TABLE `captain_provider_zones`
  ADD CONSTRAINT `captain_provider_zones_captain_provider_id_foreign` FOREIGN KEY (`captain_provider_id`) REFERENCES `captain_providers` (`id`),
  ADD CONSTRAINT `captain_provider_zones_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `captain_provider_zones_zone_id_foreign` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`id`);

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `carts_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart_foods`
--
ALTER TABLE `cart_foods`
  ADD CONSTRAINT `cart_foods_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_foods_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_foods_size_id_foreign` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_cuisine_id_foreign` FOREIGN KEY (`cuisine_id`) REFERENCES `cuisines` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `categories_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `categories_sector_id_foreign` FOREIGN KEY (`sector_id`) REFERENCES `sectors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `clubs`
--
ALTER TABLE `clubs`
  ADD CONSTRAINT `clubs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `collection_banner_items`
--
ALTER TABLE `collection_banner_items`
  ADD CONSTRAINT `collection_banner_items_collection_banner_id_foreign` FOREIGN KEY (`collection_banner_id`) REFERENCES `collection_banners` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `compensation_conditions`
--
ALTER TABLE `compensation_conditions`
  ADD CONSTRAINT `compensation_conditions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `compensation_role`
--
ALTER TABLE `compensation_role`
  ADD CONSTRAINT `compensation_role_compensation_id_foreign` FOREIGN KEY (`compensation_id`) REFERENCES `compensation` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `compensation_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `complaint_actions`
--
ALTER TABLE `complaint_actions`
  ADD CONSTRAINT `complaint_actions_complaint_id_foreign` FOREIGN KEY (`complaint_id`) REFERENCES `complaints` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `constrained_order_confirmation`
--
ALTER TABLE `constrained_order_confirmation`
  ADD CONSTRAINT `constrained_order_confirmation_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `coupons_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `coupons_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `coupon_campaign_targets`
--
ALTER TABLE `coupon_campaign_targets`
  ADD CONSTRAINT `coupon_campaign_targets_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `coupon_campaign_targets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `coupon_requests`
--
ALTER TABLE `coupon_requests`
  ADD CONSTRAINT `coupon_requests_approved_by_user_id_foreign` FOREIGN KEY (`approved_by_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `coupon_requests_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `coupon_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `coupon_times`
--
ALTER TABLE `coupon_times`
  ADD CONSTRAINT `coupon_times_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `delivery_addresses`
--
ALTER TABLE `delivery_addresses`
  ADD CONSTRAINT `delivery_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `delivery_addresses_zone_id_foreign` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `discountables`
--
ALTER TABLE `discountables`
  ADD CONSTRAINT `discountables_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dispatching`
--
ALTER TABLE `dispatching`
  ADD CONSTRAINT `dispatching_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dispatching_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dispatching_received_from_driver_id_foreign` FOREIGN KEY (`received_from_driver_id`) REFERENCES `drivers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `drivers`
--
ALTER TABLE `drivers`
  ADD CONSTRAINT `drivers_captain_provider_id_foreign` FOREIGN KEY (`captain_provider_id`) REFERENCES `captain_providers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `drivers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `drivers_fee`
--
ALTER TABLE `drivers_fee`
  ADD CONSTRAINT `drivers_fee_ragion_foreign` FOREIGN KEY (`ragion`) REFERENCES `ragions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `drivers_payouts`
--
ALTER TABLE `drivers_payouts`
  ADD CONSTRAINT `drivers_payouts_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `driver_arrivals`
--
ALTER TABLE `driver_arrivals`
  ADD CONSTRAINT `driver_arrivals_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `driver_arrivals_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `driver_captured_images`
--
ALTER TABLE `driver_captured_images`
  ADD CONSTRAINT `driver_captured_images_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `driver_sessions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `driver_cash_requests`
--
ALTER TABLE `driver_cash_requests`
  ADD CONSTRAINT `driver_cash_requests_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `driver_cash_requests_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `driver_cash_requests_status_by_id_foreign` FOREIGN KEY (`status_by_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `driver_day_offs`
--
ALTER TABLE `driver_day_offs`
  ADD CONSTRAINT `driver_day_offs_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `driver_order_notification`
--
ALTER TABLE `driver_order_notification`
  ADD CONSTRAINT `driver_order_notification_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `driver_order_notification_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `driver_requests`
--
ALTER TABLE `driver_requests`
  ADD CONSTRAINT `driver_requests_captain_provider_id_foreign` FOREIGN KEY (`captain_provider_id`) REFERENCES `captain_providers` (`id`),
  ADD CONSTRAINT `driver_requests_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `driver_requests_zone_id_foreign` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `driver_reviews`
--
ALTER TABLE `driver_reviews`
  ADD CONSTRAINT `driver_reviews_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `driver_reviews_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `driver_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `driver_sessions`
--
ALTER TABLE `driver_sessions`
  ADD CONSTRAINT `driver_sessions_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `driver_sessions_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `user_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `driver_shift_user`
--
ALTER TABLE `driver_shift_user`
  ADD CONSTRAINT `driver_shift_user_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `driver_shift_user_driver_shift_id_foreign` FOREIGN KEY (`driver_shift_id`) REFERENCES `driver_shifts` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `driver_statistics`
--
ALTER TABLE `driver_statistics`
  ADD CONSTRAINT `driver_statistics_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `driver_zones`
--
ALTER TABLE `driver_zones`
  ADD CONSTRAINT `driver_zones_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `driver_zones_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `driver_zones_zone_id_foreign` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `email_verify_tokens`
--
ALTER TABLE `email_verify_tokens`
  ADD CONSTRAINT `email_verify_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `employee_wallets`
--
ALTER TABLE `employee_wallets`
  ADD CONSTRAINT `employee_wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `employee_wallet_transactions`
--
ALTER TABLE `employee_wallet_transactions`
  ADD CONSTRAINT `employee_wallet_transactions_employee_wallet_id_foreign` FOREIGN KEY (`employee_wallet_id`) REFERENCES `employee_wallets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_wallet_transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_wallet_transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `empty_extras_branches`
--
ALTER TABLE `empty_extras_branches`
  ADD CONSTRAINT `empty_extras_branches_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empty_extras_branches_extra_id_foreign` FOREIGN KEY (`extra_id`) REFERENCES `extras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `empty_preferences_branches`
--
ALTER TABLE `empty_preferences_branches`
  ADD CONSTRAINT `empty_preferences_branches_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empty_preferences_branches_preference_id_foreign` FOREIGN KEY (`preference_id`) REFERENCES `preferences` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `empty_sizes_branches`
--
ALTER TABLE `empty_sizes_branches`
  ADD CONSTRAINT `empty_sizes_branches_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empty_sizes_branches_size_id_foreign` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `empty_stock_branches`
--
ALTER TABLE `empty_stock_branches`
  ADD CONSTRAINT `empty_stock_branches_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empty_stock_branches_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `empty_stock_branches_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `explore_menu`
--
ALTER TABLE `explore_menu`
  ADD CONSTRAINT `explore_menu_sector_id_foreign` FOREIGN KEY (`sector_id`) REFERENCES `sectors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `extras`
--
ALTER TABLE `extras`
  ADD CONSTRAINT `extras_extra_group_id_foreign` FOREIGN KEY (`extra_group_id`) REFERENCES `extra_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `extras_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `extra_food`
--
ALTER TABLE `extra_food`
  ADD CONSTRAINT `extra_food_extra_id_foreign` FOREIGN KEY (`extra_id`) REFERENCES `extras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `extra_food_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `extra_groups`
--
ALTER TABLE `extra_groups`
  ADD CONSTRAINT `extra_groups_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `extra_size`
--
ALTER TABLE `extra_size`
  ADD CONSTRAINT `extra_size_extra_id_foreign` FOREIGN KEY (`extra_id`) REFERENCES `extras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `extra_size_size_id_foreign` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `faqs`
--
ALTER TABLE `faqs`
  ADD CONSTRAINT `faqs_faq_category_id_foreign` FOREIGN KEY (`faq_category_id`) REFERENCES `faq_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `faq_roles`
--
ALTER TABLE `faq_roles`
  ADD CONSTRAINT `faq_roles_faq_id_foreign` FOREIGN KEY (`faq_id`) REFERENCES `faqs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `faq_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favorite_extras`
--
ALTER TABLE `favorite_extras`
  ADD CONSTRAINT `favorite_extras_extra_id_foreign` FOREIGN KEY (`extra_id`) REFERENCES `extras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorite_extras_favorite_id_foreign` FOREIGN KEY (`favorite_id`) REFERENCES `favorites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `first_time_passwords`
--
ALTER TABLE `first_time_passwords`
  ADD CONSTRAINT `first_time_passwords_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `foods`
--
ALTER TABLE `foods`
  ADD CONSTRAINT `foods_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foods_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `foods_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `food_offer_condition`
--
ALTER TABLE `food_offer_condition`
  ADD CONSTRAINT `food_offer_condition_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `food_offer_condition_offer_condition_id_foreign` FOREIGN KEY (`offer_condition_id`) REFERENCES `offer_conditions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `food_orders`
--
ALTER TABLE `food_orders`
  ADD CONSTRAINT `food_orders_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `food_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `food_orders_size_id_foreign` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `food_orders_history`
--
ALTER TABLE `food_orders_history`
  ADD CONSTRAINT `food_orders_history_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `food_orders_history_food_order_id_foreign` FOREIGN KEY (`food_order_id`) REFERENCES `food_orders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `food_orders_history_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `food_orders_history_size_id_foreign` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `food_preferences`
--
ALTER TABLE `food_preferences`
  ADD CONSTRAINT `food_preferences_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `food_preferences_preferences_id_foreign` FOREIGN KEY (`preferences_id`) REFERENCES `preferences` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `food_reviews`
--
ALTER TABLE `food_reviews`
  ADD CONSTRAINT `food_reviews_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `food_reviews_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `food_reviews_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `food_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `food_types`
--
ALTER TABLE `food_types`
  ADD CONSTRAINT `food_types_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `food_types_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `cuisines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `galleries`
--
ALTER TABLE `galleries`
  ADD CONSTRAINT `galleries_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `happy_hour_restaurant`
--
ALTER TABLE `happy_hour_restaurant`
  ADD CONSTRAINT `happy_hour_restaurant_happy_hours_id_foreign` FOREIGN KEY (`happy_hours_id`) REFERENCES `happy_hours` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `happy_hour_restaurant_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_builder_roles`
--
ALTER TABLE `menu_builder_roles`
  ADD CONSTRAINT `menu_builder_roles_menu_builder_id_foreign` FOREIGN KEY (`menu_builder_id`) REFERENCES `menu_builders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menu_builder_roles_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `menu_builder_roles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menu_builder_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_conversation_id_foreign` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `model_do_not_has_permissions`
--
ALTER TABLE `model_do_not_has_permissions`
  ADD CONSTRAINT `model_do_not_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_created_by_user_id_foreign` FOREIGN KEY (`created_by_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_navfood_foreign` FOREIGN KEY (`navfood`) REFERENCES `foods` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `notifications_navstore_foreign` FOREIGN KEY (`navstore`) REFERENCES `restaurants` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `notifications_notification_type_id_foreign` FOREIGN KEY (`notification_type_id`) REFERENCES `notification_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notifications_section_foreign` FOREIGN KEY (`section`) REFERENCES `sectors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `notifications_store_foreign` FOREIGN KEY (`store`) REFERENCES `restaurants` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `notification_seen`
--
ALTER TABLE `notification_seen`
  ADD CONSTRAINT `notification_seen_notification_id_foreign` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notification_seen_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notification_sents`
--
ALTER TABLE `notification_sents`
  ADD CONSTRAINT `notification_sents_created_by_user_id_foreign` FOREIGN KEY (`created_by_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notification_sents_notification_id_foreign` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notification_sent_user`
--
ALTER TABLE `notification_sent_user`
  ADD CONSTRAINT `notification_sent_user_notification_sent_id_foreign` FOREIGN KEY (`notification_sent_id`) REFERENCES `notification_sents` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notification_sent_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notification_times`
--
ALTER TABLE `notification_times`
  ADD CONSTRAINT `notification_times_notification_id_foreign` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notification_type_options`
--
ALTER TABLE `notification_type_options`
  ADD CONSTRAINT `notification_type_options_notification_id_foreign` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nutrition`
--
ALTER TABLE `nutrition`
  ADD CONSTRAINT `nutrition_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nutrition_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_assigned_how_user_id_foreign` FOREIGN KEY (`assigned_how_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_assigned_to_user_id_foreign` FOREIGN KEY (`assigned_to_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_cancellation_reason_id_foreign` FOREIGN KEY (`cancellation_reason_id`) REFERENCES `cancellation_reasons` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_cancelled_by_foreign` FOREIGN KEY (`cancelled_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_compensation_coupon_id_foreign` FOREIGN KEY (`compensation_coupon_id`) REFERENCES `coupons` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_compensation_transaction_id_foreign` FOREIGN KEY (`compensation_transaction_id`) REFERENCES `wallet_transactions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_delivery_address_id_foreign` FOREIGN KEY (`delivery_address_id`) REFERENCES `delivery_addresses` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `orders_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `orders_order_delivery_address_id_foreign` FOREIGN KEY (`order_delivery_address_id`) REFERENCES `order_delivery_address` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_order_delivery_fee_calculations_id_foreign` FOREIGN KEY (`order_delivery_fee_calculations_id`) REFERENCES `order_delivery_fee_calculations` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_order_status_id_foreign` FOREIGN KEY (`order_status_id`) REFERENCES `order_statuses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_wallet_transaction_id_foreign` FOREIGN KEY (`wallet_transaction_id`) REFERENCES `wallet_transactions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `order_delivery_address`
--
ALTER TABLE `order_delivery_address`
  ADD CONSTRAINT `order_delivery_address_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `order_delivery_address_zone_id_foreign` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `order_discounts`
--
ALTER TABLE `order_discounts`
  ADD CONSTRAINT `order_discounts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_history`
--
ALTER TABLE `order_history`
  ADD CONSTRAINT `order_history_assigned_how_user_id_foreign` FOREIGN KEY (`assigned_how_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `order_history_assigned_to_user_id_foreign` FOREIGN KEY (`assigned_to_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `order_history_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_history_cancellation_reason_id_foreign` FOREIGN KEY (`cancellation_reason_id`) REFERENCES `cancellation_reasons` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `order_history_cancelled_by_foreign` FOREIGN KEY (`cancelled_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `order_history_compensation_transaction_id_foreign` FOREIGN KEY (`compensation_transaction_id`) REFERENCES `wallet_transactions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `order_history_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_history_delivery_address_id_foreign` FOREIGN KEY (`delivery_address_id`) REFERENCES `delivery_addresses` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `order_history_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `order_history_order_delivery_address_id_foreign` FOREIGN KEY (`order_delivery_address_id`) REFERENCES `order_delivery_address` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `order_history_order_delivery_fee_calculations_id_foreign` FOREIGN KEY (`order_delivery_fee_calculations_id`) REFERENCES `order_delivery_fee_calculations` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `order_history_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_history_order_status_id_foreign` FOREIGN KEY (`order_status_id`) REFERENCES `order_statuses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_history_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_history_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_history_wallet_transaction_id_foreign` FOREIGN KEY (`wallet_transaction_id`) REFERENCES `wallet_transactions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `order_log`
--
ALTER TABLE `order_log`
  ADD CONSTRAINT `order_log_created_by_user_id_foreign` FOREIGN KEY (`created_by_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_log_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_log_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `order_statuses` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `order_rejections`
--
ALTER TABLE `order_rejections`
  ADD CONSTRAINT `order_rejections_cancellation_reason_id_foreign` FOREIGN KEY (`cancellation_reason_id`) REFERENCES `cancellation_reasons` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `order_rejections_confirmed_by_foreign` FOREIGN KEY (`confirmed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `order_rejections_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_rejections_rejected_by_foreign` FOREIGN KEY (`rejected_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_update_infos`
--
ALTER TABLE `order_update_infos`
  ADD CONSTRAINT `order_update_infos_created_by_user_id_foreign` FOREIGN KEY (`created_by_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_update_infos_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `packages_log`
--
ALTER TABLE `packages_log`
  ADD CONSTRAINT `packages_log_end_by_foreign` FOREIGN KEY (`end_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `packages_log_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `packages_log_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `package_fees`
--
ALTER TABLE `package_fees`
  ADD CONSTRAINT `package_fees_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD CONSTRAINT `payment_details_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment_log`
--
ALTER TABLE `payment_log`
  ADD CONSTRAINT `payment_log_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pending_orders`
--
ALTER TABLE `pending_orders`
  ADD CONSTRAINT `pending_orders_assigned_how_user_id_foreign` FOREIGN KEY (`assigned_how_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `pending_orders_assigned_to_user_id_foreign` FOREIGN KEY (`assigned_to_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `pending_orders_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pending_orders_cancellation_reason_id_foreign` FOREIGN KEY (`cancellation_reason_id`) REFERENCES `cancellation_reasons` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `pending_orders_cancelled_by_foreign` FOREIGN KEY (`cancelled_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `pending_orders_compensation_transaction_id_foreign` FOREIGN KEY (`compensation_transaction_id`) REFERENCES `wallet_transactions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `pending_orders_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pending_orders_delivery_address_id_foreign` FOREIGN KEY (`delivery_address_id`) REFERENCES `delivery_addresses` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `pending_orders_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `pending_orders_order_delivery_address_id_foreign` FOREIGN KEY (`order_delivery_address_id`) REFERENCES `order_delivery_address` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `pending_orders_order_delivery_fee_calculations_id_foreign` FOREIGN KEY (`order_delivery_fee_calculations_id`) REFERENCES `order_delivery_fee_calculations` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `pending_orders_order_status_id_foreign` FOREIGN KEY (`order_status_id`) REFERENCES `order_statuses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pending_orders_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pending_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pending_orders_wallet_transaction_id_foreign` FOREIGN KEY (`wallet_transaction_id`) REFERENCES `wallet_transactions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `pending_order_discounts`
--
ALTER TABLE `pending_order_discounts`
  ADD CONSTRAINT `pending_order_discounts_pending_order_id_foreign` FOREIGN KEY (`pending_order_id`) REFERENCES `pending_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pending_order_foods`
--
ALTER TABLE `pending_order_foods`
  ADD CONSTRAINT `pending_order_foods_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `pending_order_foods_pending_order_id_foreign` FOREIGN KEY (`pending_order_id`) REFERENCES `pending_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pending_order_foods_size_id_foreign` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `permission_group` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `photos`
--
ALTER TABLE `photos`
  ADD CONSTRAINT `photos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `policy_roles`
--
ALTER TABLE `policy_roles`
  ADD CONSTRAINT `policy_roles_policy_id_foreign` FOREIGN KEY (`policy_id`) REFERENCES `policies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `policy_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `popups`
--
ALTER TABLE `popups`
  ADD CONSTRAINT `popups_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `popups_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `popups_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sectors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `preferences`
--
ALTER TABLE `preferences`
  ADD CONSTRAINT `preferences_preferences_group_id_foreign` FOREIGN KEY (`preferences_group_id`) REFERENCES `preferences_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `preferences_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `preferences_group`
--
ALTER TABLE `preferences_group`
  ADD CONSTRAINT `preferences_group_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `preferences_size`
--
ALTER TABLE `preferences_size`
  ADD CONSTRAINT `preferences_size_preferences_id_foreign` FOREIGN KEY (`preferences_id`) REFERENCES `preferences` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `preferences_size_size_id_foreign` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `referrals`
--
ALTER TABLE `referrals`
  ADD CONSTRAINT `referrals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `referral_users`
--
ALTER TABLE `referral_users`
  ADD CONSTRAINT `referral_users_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `referral_users_referral_id_foreign` FOREIGN KEY (`referral_id`) REFERENCES `referrals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `referral_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD CONSTRAINT `restaurants_restaurant_group_id_foreign` FOREIGN KEY (`restaurant_group_id`) REFERENCES `restaurant_groups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `restaurants_restaurant_inactive_reason_id_foreign` FOREIGN KEY (`restaurant_inactive_reason_id`) REFERENCES `restaurant_inactive_reasons` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `restaurants_restaurant_status_id_foreign` FOREIGN KEY (`restaurant_status_id`) REFERENCES `restaurant_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `restaurants_sector_id_foreign` FOREIGN KEY (`sector_id`) REFERENCES `sectors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `restaurants_who_terminated_user_id_foreign` FOREIGN KEY (`who_terminated_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `restaurants_payouts`
--
ALTER TABLE `restaurants_payouts`
  ADD CONSTRAINT `restaurants_payouts_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `restaurant_conversations`
--
ALTER TABLE `restaurant_conversations`
  ADD CONSTRAINT `restaurant_conversations_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `restaurant_conversations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `restaurant_cuisines`
--
ALTER TABLE `restaurant_cuisines`
  ADD CONSTRAINT `restaurant_cuisines_cuisine_id_foreign` FOREIGN KEY (`cuisine_id`) REFERENCES `cuisines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `restaurant_cuisines_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `restaurant_custom_delivery_fees`
--
ALTER TABLE `restaurant_custom_delivery_fees`
  ADD CONSTRAINT `restaurant_custom_delivery_fees_delivery_vehicle_id_foreign` FOREIGN KEY (`delivery_vehicle_id`) REFERENCES `delivery_vehicles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `restaurant_custom_delivery_fees_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `restaurant_custom_delivery_fees_zone_id_foreign` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `restaurant_excluded_zones`
--
ALTER TABLE `restaurant_excluded_zones`
  ADD CONSTRAINT `restaurant_excluded_zones_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `restaurant_excluded_zones_zone_id_foreign` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `restaurant_requests`
--
ALTER TABLE `restaurant_requests`
  ADD CONSTRAINT `restaurant_requests_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `restaurant_requests_sector_id_foreign` FOREIGN KEY (`sector_id`) REFERENCES `sectors` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `restaurant_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `restaurant_requests_zone_id_foreign` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `restaurant_reviews`
--
ALTER TABLE `restaurant_reviews`
  ADD CONSTRAINT `restaurant_reviews_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `restaurant_reviews_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `restaurant_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `restaurant_sector`
--
ALTER TABLE `restaurant_sector`
  ADD CONSTRAINT `restaurant_sector_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `restaurant_sector_sector_id_foreign` FOREIGN KEY (`sector_id`) REFERENCES `sectors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `restaurant_slides`
--
ALTER TABLE `restaurant_slides`
  ADD CONSTRAINT `restaurant_slides_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `restaurant_slides_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `restaurant_types`
--
ALTER TABLE `restaurant_types`
  ADD CONSTRAINT `restaurant_types_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `restaurant_types_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `restaurant_zone_delivery_fees`
--
ALTER TABLE `restaurant_zone_delivery_fees`
  ADD CONSTRAINT `restaurant_zone_delivery_fees_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `restaurant_zone_delivery_fees_zone_id_foreign` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sizes`
--
ALTER TABLE `sizes`
  ADD CONSTRAINT `sizes_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sizes_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sizes_size_group_id_foreign` FOREIGN KEY (`size_group_id`) REFERENCES `size_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `size_group`
--
ALTER TABLE `size_group`
  ADD CONSTRAINT `size_group_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `term_roles`
--
ALTER TABLE `term_roles`
  ADD CONSTRAINT `term_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `term_roles_term_id_foreign` FOREIGN KEY (`term_id`) REFERENCES `terms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_user_status_id_foreign` FOREIGN KEY (`user_status_id`) REFERENCES `user_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_branches`
--
ALTER TABLE `user_branches`
  ADD CONSTRAINT `user_branches_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_branches_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_cities`
--
ALTER TABLE `user_cities`
  ADD CONSTRAINT `user_cities_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_cities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_coupons`
--
ALTER TABLE `user_coupons`
  ADD CONSTRAINT `user_coupons_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_coupons_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_restaurants`
--
ALTER TABLE `user_restaurants`
  ADD CONSTRAINT `user_restaurants_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_restaurants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_restaurant_groups`
--
ALTER TABLE `user_restaurant_groups`
  ADD CONSTRAINT `user_restaurant_groups_restaurant_group_id_foreign` FOREIGN KEY (`restaurant_group_id`) REFERENCES `restaurant_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_restaurant_groups_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_vendors`
--
ALTER TABLE `user_vendors`
  ADD CONSTRAINT `user_vendors_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_vendors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_zones`
--
ALTER TABLE `user_zones`
  ADD CONSTRAINT `user_zones_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_zones_zone_id_foreign` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `visits`
--
ALTER TABLE `visits`
  ADD CONSTRAINT `visits_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wallets`
--
ALTER TABLE `wallets`
  ADD CONSTRAINT `wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD CONSTRAINT `wallet_transactions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wallet_transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wallet_transactions_wallet_id_foreign` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `zones`
--
ALTER TABLE `zones`
  ADD CONSTRAINT `zones_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `zones_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;
