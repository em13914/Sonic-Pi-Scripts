use_synth :fm
use_bpm 110
x = 0
clap = "C:/Users/emarintsch.DAVINCISCHOOLS/Desktop/Another One Bites the Dust/samples/clap.wav"
happy = "C:/Users/emarintsch.DAVINCISCHOOLS/Desktop/Another One Bites the Dust/samples/are_you_happy.wav"

define :cymbal_intro do
  #first 4 measures
  16.times do
    sample :drum_cymbal_closed, amp: x
    sleep 1
    x = x + 0.0625
  end
end


define :bass_intro_loop do
  #second 4 measures
  2.times do
    play :e2
    sleep 1
    play :e2
    sleep 1
    play :e2
    sleep 1
    play :r
    sleep 5
  end
end


define :claps_loop do
  #third 4 measures
  3.times do
    play :r
    sleep 3
    sample #TODO
    sleep 1
  end
  play :r
  sleep 3
  sample #TODO
  sleep 0.5
  sample #TODO
  play :a2
  sleep 0.25
  play :g2
  sleep 0.25
end

define :are_you_happy do
  play :r
  sleep 4
  sample happy #TODO: use an array with samples loaded and iterate 4 times
  sleep 4
end

define :bass_complete_loop do
  #fourth 4 measures
  2.times do
    play :r
    sleep 4
    play :e2
    sleep 0.5
    play :e2
    sleep 0.5
    play :g2
    sleep 0.5
    play :e2
    sleep 0.25
    play :a2
    sleep 0.25
    play :r
    sleep 1.5
    play :a2
    sleep 0.25
    play :g2
    sleep 0.25
  end
end

