use_synth :fm
use_bpm 110

clap = "C:/Users/emarintsch.DAVINCISCHOOLS/Desktop/Another One Bites the Dust/samples/clap.wav"
happy = "C:/Users/emarintsch.DAVINCISCHOOLS/Desktop/Another One Bites the Dust/samples/are_you_happy.wav"
funk = "C:/Users/emarintsch.DAVINCISCHOOLS/Desktop/Another One Bites the Dust/samples/funky_guitar_riff.wav"
dust1 = "C:/Users/emarintsch.DAVINCISCHOOLS/Desktop/Another One Bites the Dust/samples/bites_the_dust.wav"
dust2 = "C:/Users/emarintsch.DAVINCISCHOOLS/Desktop/Another One Bites the Dust/samples/bites_the_dust_2.wav"
dust3 = "C:/Users/emarintsch.DAVINCISCHOOLS/Desktop/Another One Bites the Dust/samples/bites_the_dust_heyhey.wav"
freddy = [dust1, dust2, dust3, dust3]


define :cymbal_intro do
  x = 0.0625
  #first 4 measures
  16.times do
    sample :drum_cymbal_closed, amp: x
    sleep 1
    x = x + 0.05859375 #(1-0.0625)/16
  end
end

define :cymbal_loop do
  #first 4 measures
  16.times do
    sample :drum_cymbal_closed
    sleep 1
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
    sample clap
    sleep 1
  end
  play :r
  sleep 3
  sample clap
  sleep 0.5
  sample clap
  play :a2
  sleep 0.25
  play :g2
  sleep 0.25
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

define :are_you_happy do
  play :r
  sleep 12
  sample happy, amp: 0.5
  sleep 4
end

define :funky_guitar_loop do
  3.times do
    sample funk
    sleep 16
  end
  sleep 16
end

define :vocals_loop do
  i = 0
  4.times do
    sleep 12
    sample freddy[i], amp: 0.75
    sleep 4
    i += 1
  end
end


#CALL YOUR FUNCTIONS HERE

cymbal_intro

live_loop :t1 do
  cymbal_loop
  #stop
end
live_loop :t2 do
  claps_loop
  #stop
end
live_loop :t3 do
  sync :t2
  bass_intro_loop
  #stop
end
live_loop :t4 do
  sync :t2
  bass_complete_loop
  #stop
end
live_loop :t5 do
  sync :t2
  funky_guitar_loop
  #stop
end

live_loop :t6 do
  sync :t2
  vocals_loop
  #stop
end





