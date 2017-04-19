AddCSLuaFile()

SWEP.Author               = "Brak"
SWEP.Base                 = "weapon_base"
SWEP.PrintName            = "Brak Gun"
SWEP.Instructions         = [[left-click: Shoots
This gun is for executions for the great nation of Kekistan
]]

SWEP.ViewModel            = "models/weapons/c_357.mdl"
SWEP.ViewModelFlip        = false
SWEP.UseHands             = true
SWEP.WorldModel           = "models/weapons/w_357.mdl"
SWEP.SetHoldType          = "pistol"

SWEP.Weight               = 5
SWEP.AutoSwitchTo         = true
SWEP.AutoSwitchFrom       = false

SWEP.Slot                 = 1
SWEP.SlotPos              = 0

SWEP.DrawAmmo             = false
SWEP.DrawCrossHair        = true

SWEP.Spawnable            = false
SWEP.AdminSpawnable       = false

SWEP.Primary.ClipSize     = 1
SWEP.Primary.DefaultClip  = 1
SWEP.Primary.Ammo         = "357"
SWEP.Primary.Automatic    = false
SWEP.Primary.Recoil       = 0
SWEP.Primary.Damage       = 696969
SWEP.Primary.NumShots     = 3
SWEP.Primary.Spread       = 0
SWEP.Primary.Cone         = 0
SWEP.Primary.Delay        = 0.01

SWEP.Secondary.ClipSize   = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Ammo       = "none"
SWEP.Secondary.Automatic  = false

SWEP.ShouldDropOnDie      = false

local ShootSound = Sound("weapon_357.Single")

function SWEP:Initialize()

end

function SWEP:PrimaryAttack()

  if( not self:CanPrimaryAttack() ) then
    return
  end

  local ply = self:GetOwner()

  ply:LagCompensation( true )

  local Bullet = {}
      Bullet.Num    = self.Primary.NumShots
      Bullet.Src    = ply.GetShootPos()
      Bullet.Dir    = ply:GetAimVector()
      Bullet.Spread = Vector( self.Primary.Spread, self.Primary.Spread, 0 )
      Bullet.Tracer = 0
      Bullet.Damage = self.Primary.Damage
      Bullet.AmmoType = self.Primary.Ammo

  self:FireBullets( Bullet )
  self:ShootEffects()
  self:EmitSound( ShootSound )
  self.BaseClass.ShootEffects( self )
  self:TakePrimaryAmmo( 0 )
  self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)

  ply:LagCompensation( false )

end

function SWEP:CanSecondaryAttack()
    return false
end
