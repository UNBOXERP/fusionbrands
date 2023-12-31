-- ===================================================================
-- Copyright (C) 2021 Rubén Rüger <rruger@2byte.es>
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
--
-- ===================================================================

create table llx_reports_config
(
  rowid           	integer AUTO_INCREMENT PRIMARY KEY,
  entity            integer  DEFAULT 1 NOT NULL,
  type_field        varchar(60),
  value             varchar(255),
  label             varchar(255)
)ENGINE=innodb;
