BEGIN;
DELETE FROM users_rooms
WHERE EXISTS(
    SELECT * 
    FROM users u
    WHERE u.id = users_rooms.user_id 
    AND u.is_deleted = 1
);
COMMIT;
