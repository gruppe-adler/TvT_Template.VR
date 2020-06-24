for [{_i = 0}, {_i < 100}, {_i = _i + 1}] do
{
    private _a = createAgent ["Sheep_random_F", [0, 0, 0], [], 5, "CAN_COLLIDE"];
    [pen_opf, _a] call grad_animalTransport_fnc_vehicle_loadAnimal;
};
