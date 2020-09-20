BEGIN;
UPDATE users
   SET is_deleted = 1
 WHERE (corporate_phone IS NULL OR corporate_phone = '')
   AND (mobile_phone IS NULL OR mobile_phone = '')
   AND is_deleted = 0;
COMMIT;
