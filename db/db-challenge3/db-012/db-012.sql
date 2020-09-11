BEGIN;
UPDATE rooms
SET is_file_sendable = 0, updated_user_id = 1
WHERE id NOT IN (
    SELECT room_id
    FROM users_rooms
    WHERE user_id = 1
)
AND is_deleted = 0
AND is_file_sendable = 1;
COMMIT;
