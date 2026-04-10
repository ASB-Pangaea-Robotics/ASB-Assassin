-- AI Generated so there may be some issues
USE blitz;
-- Players
INSERT INTO `players` (`asb_id`, `points`, `amount_owed`, `email`, `has_bounty`, `grade`, `friend_group`, `eliminated`) VALUES
(1001, 150, 0.00,  'alex.johnson@school.edu',    false, 12, 'The Sharks',    false),
(1002, 120, 5.00,  'bella.smith@school.edu',     true,  12, 'The Sharks',    false),
(1003, 90,  10.00, 'carlos.diaz@school.edu',     false, 11, 'Fire Squad',    false),
(1004, 200, 0.00,  'diana.lee@school.edu',       true,  12, 'The Sharks',    false),
(1005, 60,  15.00, 'ethan.brown@school.edu',     false, 11, 'Fire Squad',    true),
(1006, 175, 0.00,  'fiona.wang@school.edu',      false, 12, 'Night Wolves',  false),
(1007, 80,  5.00,  'george.kim@school.edu',      true,  10, 'Fire Squad',    false),
(1008, 110, 0.00,  'hannah.patel@school.edu',    false, 11, 'Night Wolves',  false),
(1009, 50,  20.00, 'ivan.garcia@school.edu',     false, 10, 'The Cobras',    true),
(1010, 130, 0.00,  'julia.chen@school.edu',      true,  12, 'Night Wolves',  false),
(1011, 95,  5.00,  'kevin.nguyen@school.edu',    false, 11, 'The Cobras',    false),
(1012, 145, 0.00,  'luna.martinez@school.edu',   false, 12, 'The Cobras',    false),
(1013, 70,  10.00, 'mike.thompson@school.edu',   true,  10, 'The Cobras',    false),
(1014, 160, 0.00,  'nina.robinson@school.edu',   false, 12, 'The Sharks',    false),
(1015, 40,  25.00, 'oscar.white@school.edu',     false, 10, 'Night Wolves',  true);

-- Player Groups
INSERT INTO `player_group` (`player1`, `player2`, `player3`, `player4`, `player5`) VALUES
(1001, 1002, 1004, 1014, NULL),   -- id=1: The Sharks
(1003, 1005, 1007, NULL, NULL),   -- id=2: Fire Squad
(1006, 1008, 1010, 1015, NULL),   -- id=3: Night Wolves
(1009, 1011, 1012, 1013, NULL);   -- id=4: The Cobras

-- Powerups
INSERT INTO `powerups` (`price`, `name`, `description`) VALUES
(5.00,  'Shield',        'Protects you from elimination for 24 hours'),
(10.00, 'Double Points', 'Earn double points on your next successful blitz'),
(7.50,  'Bounty Hunter', 'Reveals the location of a target with a bounty'),
(15.00, 'Group Blitz',   'Allows your entire group to target one player simultaneously'),
(3.00,  'Snitch',        'Reveals which group is targeting you');

-- Target Log
-- Rules enforced:
--   video_evidence_path is always populated
--   multiple_targets  = true  <=> target_group  IS NOT NULL
--   multiple_blitzers = true  <=> blitzer_group IS NOT NULL

INSERT INTO `target_log` (`id`, `target`, `blitzer`, `target_group`, `blitzer_group`, `multiple_targets`, `multiple_blitzers`, `is_completed`, `in_review`, `video_evidence_path`, `time_stamp`) VALUES
-- 1v1: single target, single blitzer
(1,  1005, 1003, NULL, NULL, false, false, true,  false, '/evidence/videos/blitz_001.mp4', '2024-03-01 10:23:00'),
-- 1v1
(2,  1009, 1012, NULL, NULL, false, false, true,  false, '/evidence/videos/blitz_002.mp4', '2024-03-01 14:05:00'),
-- 1v1
(3,  1015, 1006, NULL, NULL, false, false, true,  false, '/evidence/videos/blitz_003.mp4', '2024-03-02 16:40:00'),
-- 1v1
(4,  1007, 1001, NULL, NULL, false, false, false, true,  '/evidence/videos/blitz_004.mp4', '2024-03-03 08:20:00'),
-- 1v1
(5,  1010, 1014, NULL, NULL, false, false, false, true,  '/evidence/videos/blitz_005.mp4', '2024-03-03 13:00:00'),
-- Group blitzers → single target: blitzer_group set, multiple_blitzers=true; target_group NULL, multiple_targets=false
(6,  1002, 1003, NULL, 2,    false, true,  true,  false, '/evidence/videos/blitz_006.mp4', '2024-03-04 08:50:00'),
-- Group blitzers → single target
(7,  1004, 1006, NULL, 3,    false, true,  false, true,  '/evidence/videos/blitz_007.mp4', '2024-03-04 15:20:00'),
-- Group blitzers → single target
(8,  1013, 1011, NULL, 4,    false, true,  false, true,  '/evidence/videos/blitz_008.mp4', '2024-03-05 10:10:00'),
-- Single blitzer → group target: target_group set, multiple_targets=true; blitzer_group NULL, multiple_blitzers=false
(9,  1008, 1001, 3,    NULL, true,  false, true,  false, '/evidence/videos/blitz_009.mp4', '2024-03-05 14:30:00'),
-- Single blitzer → group target
(10, 1011, 1014, 4,    NULL, true,  false, false, true,  '/evidence/videos/blitz_010.mp4', '2024-03-05 17:45:00');

-- Transaction Log
INSERT INTO `transaction_log` (`asb_id`, `price`, `powerup`, `time_stamp`) VALUES
(1001, 5.00,  1, '2024-02-28 09:00:00'),
(1004, 10.00, 2, '2024-02-28 11:30:00'),
(1006, 7.50,  3, '2024-03-01 08:45:00'),
(1002, 5.00,  1, '2024-03-01 12:00:00'),
(1012, 15.00, 4, '2024-03-02 10:15:00'),
(1010, 3.00,  5, '2024-03-02 14:30:00'),
(1003, 10.00, 2, '2024-03-03 09:30:00'),
(1014, 7.50,  3, '2024-03-03 16:00:00'),
(1008, 5.00,  1, '2024-03-04 11:00:00'),
(1001, 15.00, 4, '2024-03-04 13:45:00'),
(1007, 3.00,  5, '2024-03-05 08:30:00'),
(1013, 10.00, 2, '2024-03-05 15:00:00');