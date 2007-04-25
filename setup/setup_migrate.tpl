<div>
    <div class='default'>

		{if $method == "default"}
			{foreach from=$checks item=val key=key}
				<div class='step2_entry_name'><b>{$checks.$key.TITLE}</b></div>
				{if $checks.$key.STATUS}
					<div class='step2_successful'>{$checks.$key.STATUS_MSG}
					{if $checks.$key.ERROR_MSG}
						{$checks.$key.ERROR_MSG}
					{/if}
					</div>
				{else}
					<div class='step2_failed'>{$checks.$key.STATUS_MSG}
					{if $checks.$key.ERROR_MSG}
						{$checks.$key.ERROR_MSG}
					{/if}
					</div>
				{/if}
				<div style='height:10px;'>&nbsp;</div>
			{/foreach}
		{elseif $method == "migrate"}
	
			<h2>Department migration</h2>

			{t}The listed deparmtents below are currenlty invisble in the GOsa user interface. If you want to migrate a set of departments, just select them and use the migrate button below.{/t}<br>
			{t}If you want to know what will be done when migrating the selected entries, just use the 'What will be done here' button and you will see a list of changes.{/t}
					

			<br><br>
			{foreach from=$deps_to_migrate item=val key=key}

				{if $deps_to_migrate.$key.checked}
					<input type='checkbox' name='migrate_{$key}' checked>
					{$deps_to_migrate.$key.dn}
					{if $deps_to_migrate.$key.after != ""}
						<div class="step2_entry_container_info" id="sol_8">

{t}Current{/t}
<div style='padding-left:20px;'>
<pre>
dn: {$deps_to_migrate.$key.dn}
{$deps_to_migrate.$key.before}
</pre>
</div>
{t}After migration{/t}
<div style='padding-left:20px;'>
<pre>
dn: {$deps_to_migrate.$key.dn}
{$deps_to_migrate.$key.after}
</pre>
</div>
						</div>
					{/if}
				{else}
					<input type='checkbox' name='migrate_{$key}'>
					{$deps_to_migrate.$key.dn}
				{/if}

				<br>
				

			{/foreach}
			<br>

			<input type='submit' name='deps_visible_migrate_refresh' value='{t}Reload list{/t}'>
			<input type='submit' name='deps_visible_migrate_migrate' value='{t}Migrate{/t}'>
			<input type='submit' name='deps_visible_migrate_whatsdone' value='{t}What will be done here{/t}'>

			<p class='seperator'>&nbsp;</p>	

			<div style='width:100%; text-align:right; padding:5px;'>
				<input type='submit' name='deps_visible_migrate_close' value='{t}Close{/t}'>
			</div>
		{else}

	* Create a test department with some objects to check for correct permissions
	<br>
	* Look for ACL's. If none is there, choose one user to be the super administrator
	<br>
	* Look for organizationalUnits and let add GOsa departments for selected ones
	<br>
	* Look for person / organizationalPerson and add GOsa account
	<br>
	* Allow to move selected users to people ou's - take care for groupOfNames
	<br>
	* Allow to move selected groups to group ou's - take care for groupOfNames
	<br>
	* Allow to move selected winstations to winstation ou's - take care for groupOfNames
	<br>
	* Check for double uidNumbers/gidNumbers
	<br>
	* Check for mail accounts and add gosaMailAccount - optionally create these accounts on the IMAP server

	
	{/if}
    </div>
</div>