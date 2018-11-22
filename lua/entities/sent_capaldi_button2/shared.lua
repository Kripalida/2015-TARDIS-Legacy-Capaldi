ENT.Type = "anim"
if WireLib then
	ENT.Base 			= "base_wire_entity"
else
	ENT.Base			= "base_gmodentity"
end 
ENT.PrintName		= "TARDIS Button"
ENT.Author			= "Dr. Matt"
ENT.Spawnable		= false
ENT.AdminSpawnable	= false
ENT.Category		= "Doctor Who"
ENT.capaldi_part		= true

function ENT:SetupDataTables()
	self:NetworkVar( "Bool",	0,	"On" );
	self:NetworkVar( "Bool",	1,	"IsToggle" );

	self:SetOn( false )
	self:SetIsToggle( true );
end