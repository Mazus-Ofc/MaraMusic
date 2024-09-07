Config = {}

Config.DistanceToVolume = 100.0 -- The distance that will be with the volume at 1.0, so if the volume is 0.5 the distance will be 15.0, if the volume is 0.2 the distance will be 6.

Config.PlayToEveryone = true    -- The music in car will be played to everyone? Or just for the people that are in that vehicle? If false the DistanceToVolume will not do anything

Config.PrecisaDePermissao = true

Config.ItemInVehicle = false  -- Put here, if you want the radio to be an item, inside "", like "radio". With or false you will need to do /carradio

Config.CommandVehicle = "som" -- Only will work if Config.ItemInVehicle == false

Config.Permissao = "perm.spotify"

Config.Zones = {
    {
        name = "Vanilla Zone",                             -- The name of the radio, it doesn't matter
        coords = vector3(121.96, -1281.38, 29.47),         -- the position where the music is played
        range = 40.0,                                      -- the range that music can be heard
        volume = 0.1,                                      --default volume? min 0.00, max 1.00
        deflink = "https://www.youtube.com/watch?v=N6ORdxoJH2Q", -- the default link, if nill it won't play nothing
        isplaying = false,                                 -- the music will play when the server start?
        loop = false,                                      -- when the music stops it will repaeat?
        deftime = 0,                                       -- where does the music starts? 0 and it will start in the beginning
        changemusicblip = vector3(121.96, -1281.38, 29.47), -- where the player can change the music
        PermissaoFac = "perm.vanilla",                     --the job that can change the music
    },
    {
        name = "Tequilala",                                -- The name of the radio, it doesn't matter
        coords = vector3(-550.47, 286.1, 82.98),           -- the position where the music is played
        range = 35.0,                                      -- the range that music can be heard
        volume = 0.1,                                      --default volume? min 0.00, max 1.00
        deflink = "https://www.youtube.com/watch?v=XnUNOaxw6bs", -- the default link, if nill it won't play nothing
        isplaying = false,                                 -- will the music play when the server start?
        loop = false,                                      -- when does the music stop it will repaeat?
        deftime = 0,                                       -- where does the music starts? 0 and it will start in the beginning
        changemusicblip = vector3(-550.47, 286.1, 82.98),  -- where the player can change the music
        PermissaoFac = "perm.tequilala",                   --the job that can change the music
    },
    {
        name = "Bahamas",                                  -- The name of the radio, it doesn't matter
        coords = vector3(-1378.52, -628.99, 30.63),        -- the position where the music is played
        range = 40.0,                                      -- the range that music can be heard
        volume = 0.1,                                      --default volume? min 0.00, max 1.00
        deflink = "https://www.youtube.com/watch?v=CyfxBf9j2kU", -- the default link, if nill it won't play nothing
        isplaying = false,                                 -- will the music play when the server start?
        loop = false,                                      -- when does the music stop it will repaeat?
        deftime = 0,                                       -- where does the music starts? 0 and it will start in the beginning
        changemusicblip = vector3(-1378.52, -628.99, 30.63), -- where the player can change the music
        PermissaoFac = "perm.bahamas",                     --the job that can change the music
    },
    {
        name = "Cupula",                                   -- The name of the radio, it doesn't matter
        coords = vector3(-503.39, 4415.0, 31.24),          -- the position where the music is played
        range = 80.0,                                      -- the range that music can be heard
        volume = 0.1,                                      --default volume? min 0.00, max 1.00
        deflink = "https://www.youtube.com/watch?v=XnUNOaxw6bs", -- the default link, if nill it won't play nothing
        isplaying = false,                                 -- will the music play when the server start?
        loop = false,                                      -- when does the music stop it will repaeat?
        deftime = 0,                                       -- where does the music starts? 0 and it will start in the beginning
        changemusicblip = vector3(-503.39, 4415.0, 31.24), -- where the player can change the music
        PermissaoFac = "perm.cupula",                      --the job that can change the music
    },
    {
        name = "MotoClube",                                -- The name of the radio, it doesn't matter
        coords = vector3(983.35, -132.9, 78.89),           -- the position where the music is played
        range = 30.0,                                      -- the range that music can be heard
        volume = 0.1,                                      --default volume? min 0.00, max 1.00
        deflink = "https://www.youtube.com/watch?v=XnUNOaxw6bs", -- the default link, if nill it won't play nothing
        isplaying = false,                                 -- will the music play when the server start?
        loop = false,                                      -- when does the music stop it will repaeat?
        deftime = 0,                                       -- where does the music starts? 0 and it will start in the beginning
        changemusicblip = vector3(983.35, -132.9, 78.89),  -- where the player can change the music
        PermissaoFac = "perm.motoclub",                    --the job that can change the music
    },
}
