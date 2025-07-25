<?php
/*
 * This code is part of GOsa (http://www.gosa-project.org)
 * Copyright (C) 2003-2008 GONICUS GmbH
 *
 * ID: $$Id: tabs_group.inc 9275 2008-03-04 07:29:22Z cajus $$
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

class sudotabs extends tabs
{
  function __construct($config, $data, $dn)
  {
    tabs::__construct($config, $data, $dn,"sudo");
    $this->addSpecialTabs();
  }

  function set_default($state)
  {
    if(isset($this->by_object['sudo'])){
      $this->by_object['sudo']->set_default($state);
    }
  }

  function save($ignore_account= FALSE)
  {
    $baseobject= $this->by_object['sudo'];

    /* Check for new 'dn', in order to propagate the
       'dn' to all plugins */
    $cn      = preg_replace('/,/', '\,', $baseobject->get_cn()); 
    $cn      = preg_replace('/"/', '\"', $cn); 
    $new_dn= 'cn='.$cn.','.sudo::get_sudoers_ou($baseobject->config);

    /* Move group? */
    if ($this->dn != $new_dn){

      /* Write entry on new 'dn' */
      if ($this->dn != "new"){
        $baseobject->update_acls($this->dn,$new_dn);
        $baseobject->move($this->dn, $new_dn);
        $this->by_object['sudo']= $baseobject;
      }

      /* Happen to use the new one */
      $this->dn= $new_dn;
    }
    $ret= tabs::save();
    return $ret;
  }
}

?>
