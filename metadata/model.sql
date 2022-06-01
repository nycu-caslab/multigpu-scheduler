CREATE TABLE `Task` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `model` int,
  `user` varchar(255),
  `qos` int
);

CREATE TABLE `Model` (
  `id` int PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE `Layer` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `type` ENUM ('conv', 'relu', 'bn', 'fc'),
  `args` varchar(255),
  `layer_no` int,
  `model` int
);

CREATE TABLE `Layer_Latency` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `layer` int
);

CREATE TABLE `Movement` (
  `gpu1` int,
  `gpu2` int,
  `bytes_per_sec` int
);

CREATE TABLE `GPU` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `gpu_spec` int
);

CREATE TABLE `GPU_Spec` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255)
);

CREATE TABLE `Weight_Entry` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `layer` int,
  `gpu` int
);

ALTER TABLE `Task` ADD FOREIGN KEY (`model`) REFERENCES `Model` (`id`);

ALTER TABLE `GPU` ADD FOREIGN KEY (`gpu_spec`) REFERENCES `GPU_Spec` (`id`);

ALTER TABLE `Movement` ADD FOREIGN KEY (`gpu1`) REFERENCES `GPU` (`id`);

ALTER TABLE `Movement` ADD FOREIGN KEY (`gpu2`) REFERENCES `GPU` (`id`);

ALTER TABLE `Layer` ADD FOREIGN KEY (`model`) REFERENCES `Model` (`id`);

ALTER TABLE `Layer_Latency` ADD FOREIGN KEY (`layer`) REFERENCES `Layer` (`id`);

ALTER TABLE `Weight_Entry` ADD FOREIGN KEY (`layer`) REFERENCES `Layer` (`id`);

ALTER TABLE `Weight_Entry` ADD FOREIGN KEY (`gpu`) REFERENCES `GPU` (`id`);

