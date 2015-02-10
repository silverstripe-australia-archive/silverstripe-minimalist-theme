<% with DateRangeForm %>

	<form $FormAttributes>
		<% if ErrorMessage %>
			<div id="{$FormName}_error" class="message $ErrorMessageType">$ErrorMessage</div>
		<% else %>
			<div id="{$FormName}_error" class="message $ErrorMessageType" style="display: none"></div>
		<% end_if %>

		<fieldset>
			<div class="fromto clearfix">
				$Fields.dataFieldByName('from').FieldHolder
				$Fields.dataFieldByName('to').FieldHolder
			</div>
			<div class="field-note">Tip: Leave one field blank to search for a single date.</div>
			$Fields.dataFieldByName(tag)
			$Fields.dataFieldByName(SecurityID)
		</fieldset>

		<div class="Actions clearfix">
			<% if Actions %>
				<% loop Actions %>$Field<% end_loop %>
			<% end_if %>
		</div>
	</form>
<% end_with %>