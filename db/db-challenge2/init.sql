CREATE TABLE `users` (
      `user_id` int(11) NOT NULL AUTO_INCREMENT,
      `user_name` varchar(100) NOT NULL,
      `user_discription` varchar(1000),
      `mobile_number` varchar(13),
      `corporate_number` varchar(13),
      `email` varchar(100) NOT NULL,
      `password` varchar(100) NOT NULL,
      `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
      `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
      `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `rooms` (
    `room_id` int(11) NOT NULL AUTO_INCREMENT,
    `created_user_id` int(11) NOT NULL,
    `updated_user_id` int(11) NOT NULL,
    `room_name` varchar(100) NOT NULL,
    `room_description` varchar(1000),
    `is_sendable_file` tinyint(1) NOT NULL DEFAULT 1,
    `is_direct_chat` tinyint(1) NOT NULL DEFAULT 0,
    `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
    `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`room_id`),
    FOREIGN KEY user_room_created_key(`created_user_id`) REFERENCES `users`(`user_id`),
    FOREIGN KEY user_room_updated_key(`updated_user_id`) REFERENCES `users`(`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `users_rooms`(
    `user_id` int(11) NOT NULL,
    `room_id` int(11) NOT NULL,
    `joined_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`user_id`,`room_id`),
    FOREIGN KEY user_member_key(`user_id`) REFERENCES `users`(`user_id`),
    FOREIGN KEY room_member_key(`room_id`) REFERENCES `rooms`(`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `posts` (
    `post_id` int(11) NOT NULL AUTO_INCREMENT,
    `created_user_id` int(11) NOT NULL,
    `updated_user_id` int(11) NOT NULL,
    `room_id` int(11) NOT NULL,
    `post_contents` varchar(1000),
    `file_name` varchar(100),
    `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
    `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`post_id`),
    FOREIGN KEY user_post_created_key(`created_user_id`) REFERENCES `users`(`user_id`),
    FOREIGN KEY user_post_updated_key(`updated_user_id`) REFERENCES `users`(`user_id`),
    FOREIGN KEY room_post_key(`room_id`) REFERENCES `rooms`(`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `tasks` (
    `task_id` int(11) NOT NULL AUTO_INCREMENT,
    `created_user_id` int(11) NOT NULL,
    `updated_user_id` int(11) NOT NULL,
    `task_manager_id` int(11) NOT NULL,
    `room_id` int(11) NOT NULL,
    `task_contents` varchar(1000) NOT NULL,
    `deadline` datetime,
    `is_completed` tinyint(1) NOT NULL DEFAULT 0,
    `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
    `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`task_id`),
    FOREIGN KEY user_task_created_key(`created_user_id`) REFERENCES `users`(`user_id`),
    FOREIGN KEY user_task_updated_key(`updated_user_id`) REFERENCES `users`(`user_id`),
    FOREIGN KEY user_task_admin_key(`task_manager_id`) REFERENCES `users`(`user_id`),
    FOREIGN KEY room_task_key(`room_id`) REFERENCES `rooms`(`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;
