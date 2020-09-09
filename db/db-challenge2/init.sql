CREATE TABLE `users` (
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `name` varchar(100) NOT NULL,
      `discription` varchar(1000),
      `mobile_phone` varchar(13),
      `corporate_phone` varchar(13),
      `email` varchar(100) NOT NULL,
      `password` varchar(100) NOT NULL,
      `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
      `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
      `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `rooms` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `created_user_id` int(11) NOT NULL,
    `updated_user_id` int(11) NOT NULL,
    `name` varchar(100) NOT NULL,
    `description` varchar(1000),
    `is_file_sendable` tinyint(1) NOT NULL DEFAULT 1,
    `is_direct_chat` tinyint(1) NOT NULL DEFAULT 0,
    `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
    `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY user_room_created_key(`created_user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY user_room_updated_key(`updated_user_id`) REFERENCES `users`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `users_rooms`(
    `user_id` int(11) NOT NULL,
    `room_id` int(11) NOT NULL,
    `joined_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`user_id`,`room_id`),
    FOREIGN KEY user_member_key(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY room_member_key(`room_id`) REFERENCES `rooms`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `posts` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `created_user_id` int(11) NOT NULL,
    `updated_user_id` int(11) NOT NULL,
    `room_id` int(11) NOT NULL,
    `contents` varchar(1000),
    `file_name` varchar(100),
    `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
    `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY user_post_created_key(`created_user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY user_post_updated_key(`updated_user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY room_post_key(`room_id`) REFERENCES `rooms`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `tasks` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `created_user_id` int(11) NOT NULL,
    `updated_user_id` int(11) NOT NULL,
    `manager_id` int(11) NOT NULL,
    `room_id` int(11) NOT NULL,
    `contents` varchar(1000) NOT NULL,
    `deadline` datetime,
    `is_completed` tinyint(1) NOT NULL DEFAULT 0,
    `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
    `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY user_task_created_key(`created_user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY user_task_updated_key(`updated_user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY user_task_admin_key(`manager_id`) REFERENCES `users`(`id`),
    FOREIGN KEY room_task_key(`room_id`) REFERENCES `rooms`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;
