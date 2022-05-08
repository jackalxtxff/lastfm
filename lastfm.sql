-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 08 2022 г., 13:39
-- Версия сервера: 5.7.33
-- Версия PHP: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `lastfm`
--

-- --------------------------------------------------------

--
-- Структура таблицы `albums`
--

CREATE TABLE `albums` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `album` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `artist` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `albums`
--

INSERT INTO `albums` (`id`, `user_id`, `album`, `artist`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'Правило', 'Pharaoh', NULL, 'https://lastfm.freetls.fastly.net/i/u/174s/6e92fe0cff920f671ee5eb4e2f0f4e59.jpg', '2022-05-08 06:33:10', '2022-05-08 06:33:10'),
(2, 1, '27', 'Feduk', NULL, 'https://lastfm.freetls.fastly.net/i/u/174s/3df4dae6949cc85da3371b3492f22361.jpg', '2022-05-08 06:33:19', '2022-05-08 06:33:19'),
(3, 1, 'Вина', 'Три Дня Дождя', NULL, 'https://lastfm.freetls.fastly.net/i/u/174s/e3ba8b9a126fd273d7437883211b108d.jpg', '2022-05-08 06:34:04', '2022-05-08 06:34:04'),
(4, 1, 'Выдыхай', 'Три Дня Дождя', NULL, 'https://lastfm.freetls.fastly.net/i/u/174s/2a52c5aaeb85992cb61b2304c497799d.jpg', '2022-05-08 06:34:45', '2022-05-08 06:34:45'),
(5, 1, 'Freaks', 'Surf Curse', NULL, 'https://lastfm.freetls.fastly.net/i/u/174s/ecf0b70a0e8d326dbb946086fe282679.jpg', '2022-05-08 06:35:44', '2022-05-08 06:35:44'),
(6, 1, 'Все что вокруг', 'Нервы', NULL, 'https://lastfm.freetls.fastly.net/i/u/174s/08c863198f8045a7c580a1af156cfc47.jpg', '2022-05-08 06:36:34', '2022-05-08 06:36:34'),
(7, 1, 'Breathe', 'The Prodigy', NULL, 'https://lastfm.freetls.fastly.net/i/u/174s/a2c09cf910fa02b09b03e6cf7fb52896.png', '2022-05-08 06:37:54', '2022-05-08 06:37:54'),
(8, 1, 'I Hear Them Calling (feat. Kid Cudi)', 'Bobby JaGGerJacK', NULL, 'https://lastfm.freetls.fastly.net/i/u/174s/80ca7a86026810a83691ee3ea619e1a0.jpg', '2022-05-08 06:39:14', '2022-05-08 06:39:14');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `logs`
--

CREATE TABLE `logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `album_id` bigint(20) UNSIGNED NOT NULL,
  `album` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `artist` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `logs`
--

INSERT INTO `logs` (`id`, `album_id`, `album`, `artist`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'Правило', 'Pharaoh', NULL, 'https://lastfm.freetls.fastly.net/i/u/174s/6e92fe0cff920f671ee5eb4e2f0f4e59.jpg', '2022-05-08 06:33:10', '2022-05-08 06:33:10'),
(2, 2, '27', 'Feduk', NULL, 'https://lastfm.freetls.fastly.net/i/u/174s/3df4dae6949cc85da3371b3492f22361.jpg', '2022-05-08 06:33:19', '2022-05-08 06:33:19'),
(3, 3, 'Вина', 'Три Дня Дождя', NULL, 'https://lastfm.freetls.fastly.net/i/u/174s/e3ba8b9a126fd273d7437883211b108d.jpg', '2022-05-08 06:34:04', '2022-05-08 06:34:04'),
(4, 4, 'Выдыхай', 'Три Дня Дождя', NULL, 'https://lastfm.freetls.fastly.net/i/u/174s/2a52c5aaeb85992cb61b2304c497799d.jpg', '2022-05-08 06:34:45', '2022-05-08 06:34:45'),
(5, 5, 'Freaks', 'Surf Curse', NULL, 'https://lastfm.freetls.fastly.net/i/u/174s/ecf0b70a0e8d326dbb946086fe282679.jpg', '2022-05-08 06:35:44', '2022-05-08 06:35:44'),
(6, 6, 'Все что вокруг', 'Нервы', NULL, 'https://lastfm.freetls.fastly.net/i/u/174s/08c863198f8045a7c580a1af156cfc47.jpg', '2022-05-08 06:36:34', '2022-05-08 06:36:34'),
(7, 7, 'Breathe', 'The Prodigy', NULL, 'https://lastfm.freetls.fastly.net/i/u/174s/a2c09cf910fa02b09b03e6cf7fb52896.png', '2022-05-08 06:37:54', '2022-05-08 06:37:54'),
(8, 8, 'I Hear Them Calling (feat. Kid Cudi)', 'Bobby JaGGerJacK', NULL, 'https://lastfm.freetls.fastly.net/i/u/174s/80ca7a86026810a83691ee3ea619e1a0.jpg', '2022-05-08 06:39:14', '2022-05-08 06:39:14');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(22, '2014_10_12_000000_create_users_table', 1),
(23, '2014_10_12_100000_create_password_resets_table', 1),
(24, '2019_08_19_000000_create_failed_jobs_table', 1),
(25, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(26, '2022_05_07_112154_create_albums_table', 1),
(27, '2022_05_07_203406_create_logs_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'test', 'test@test.test', NULL, '$2y$10$0Kir9E36onUlQERPEzvo3umoHCWCeHMrB5JoX6jWlbPPDuYmBkNvK', NULL, '2022-05-08 06:33:04', '2022-05-08 06:33:04');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`),
  ADD KEY `album_user_idx` (`user_id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `log_album_idx` (`album_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `albums`
--
ALTER TABLE `albums`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `logs`
--
ALTER TABLE `logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `albums`
--
ALTER TABLE `albums`
  ADD CONSTRAINT `album_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `log_album_fk` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
