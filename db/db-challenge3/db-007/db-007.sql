SELECT id, created_user_id, name, description, 
    CASE is_file_sendable   WHEN 1 THEN '許可'  
                            WHEN 0 THEN '禁止' END AS is_file_sendable,
    is_direct_chat, is_deleted, created_at, updated_at
FROM rooms
WHERE is_deleted = 0 
AND description LIKE '%ダイレクトチャット'
ORDER BY id;
