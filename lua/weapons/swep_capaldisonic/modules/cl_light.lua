-- Light

SWEP:AddHook("Initialize", "light", function(self)
	self.emitter = ParticleEmitter(self:GetPos())
	self.rgb = Color(GetConVarNumber("capaldisonic_light_r"), GetConVarNumber("capaldisonic_light_g"), GetConVarNumber("capaldisonic_light_b"))
end)

SWEP:AddHook("PreDrawViewModel", "light", function(self,vm,ply,wep,keydown1,keydown2)
	local cureffect=0
	if (keydown1 or keydown2) then
		local r,g,b=GetConVarNumber("capaldisonic_light_r"),GetConVarNumber("capaldisonic_light_g"),GetConVarNumber("capaldisonic_light_b")
		if tobool(GetConVarNumber("capaldisonic_light")) and CurTime()>cureffect then
			cureffect=CurTime()+0.05
			self.emitter:SetPos(vm:GetPos())
			local velocity = LocalPlayer():GetVelocity()
			local spawnpos = vm:LocalToWorld(Vector(19,-2.80,-2.2))
			local particle = self.emitter:Add("sprites/glow04_noz", spawnpos)
			if (particle) then
				particle:SetVelocity(velocity)
				particle:SetLifeTime(0)
				particle:SetColor(r,g,b)
				particle:SetDieTime(0.02)
				particle:SetStartSize(3)
				particle:SetEndSize(3)
				particle:SetAirResistance(0)
				particle:SetCollide(false)
				particle:SetBounce(0)
			end
		end
		if tobool(GetConVarNumber("capaldisonic_dynamiclight")) then
			local dlight = DynamicLight( self:EntIndex() )
			if ( dlight ) then
				local size=75
				dlight.Pos = vm:LocalToWorld(Vector(35,0,0))
				dlight.r = r
				dlight.g = g
				dlight.b = b
				dlight.Brightness = 5
				dlight.Decay = size * 5
				dlight.Size = size
				dlight.DieTime = CurTime() + 1
			end
		end
	end
end)