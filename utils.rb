$p_sn = bools(0,0,0,0,1,0,0,0)
$p_bd = bools(1,1,0,0,0,0,0,0,0,1,1,0,0,0,0,0)
$p_offbeat = spread(5,16).rotate(0)

define :drums do |notes, sustain = 1.0|
  midi notes + 36, port: :iac_driver_bus_1, sustain: sustain
end

define :bass do |notes, sustain|
  midi notes, port: :iac_driver_bus_2, sustain: sustain
end

define :mids do |notes, sustain|
  midi notes, port: :iac_driver_bus_3, sustain: sustain
end

define :leads do |notes, sustain|
  midi notes, port: :iac_driver_bus_4, sustain: sustain
end

define :ambiance do |notes, sustain = 1.0|
  midi notes, port: :iac_driver_bus_5, sustain: sustain
end

live_loop :clock do
  midi_start port: :iac_driver_bus_1 if tick == 0
  8.times do
    midi_clock_beat port: :iac_driver_bus_1
    sleep 1
  end
end
