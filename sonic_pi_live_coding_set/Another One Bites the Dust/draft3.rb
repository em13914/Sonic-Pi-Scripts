use_synth :fm
use_bpm 110

clap = "C:/Users/emarintsch.DAVINCISCHOOLS/Desktop/Another One Bites the Dust/samples/clap.wav"
happy = "C:/Users/emarintsch.DAVINCISCHOOLS/Desktop/Another One Bites the Dust/samples/are_you_happy.wav"
funk = "C:/Users/emarintsch.DAVINCISCHOOLS/Desktop/Another One Bites the Dust/samples/funky_guitar_riff.wav"
intro1 = "C:/Users/emarintsch.DAVINCISCHOOLS/Desktop/Another One Bites the Dust/samples/intro_1.wav"
intro2 = "C:/Users/emarintsch.DAVINCISCHOOLS/Desktop/Another One Bites the Dust/samples/intro_2.wav"
dust1 = "C:/Users/emarintsch.DAVINCISCHOOLS/Desktop/Another One Bites the Dust/samples/bites_the_dust.wav"
dust2 = "C:/Users/emarintsch.DAVINCISCHOOLS/Desktop/Another One Bites the Dust/samples/bites_the_dust_2.wav"
dust3 = "C:/Users/emarintsch.DAVINCISCHOOLS/Desktop/Another One Bites the Dust/samples/bites_the_dust_heyhey.wav"
dust_final = "C:/Users/emarintsch.DAVINCISCHOOLS/Desktop/Another One Bites the Dust/samples/bites_the_dust_final.wav"

freddy = [intro1, intro2, dust1, dust2, dust3, dust3]


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
  print "complete"
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

define :cymbal_build do
  sleep 8
  sample :drum_splash_soft, rate: -1, beat_stretch: 16
  sleep 24
end

define :funky_guitar_loop do
  3.times do
    sample funk
    sleep 16
  end
  sleep 16
end

define :vocals_loop do
  i = 2 #change to i=2 if you don't want the two intro samples
  6.times do
    sleep 12
    sample freddy[i], amp: 0.75
    sleep 4
    i += 1
  end
end


#CALL YOUR FUNCTIONS HERE
cymbal_intro

live_loop :t1 do
  claps_loop
  #stop
end
live_loop :t2 do
  sync :t1
  cymbal_loop
  #stop
end
live_loop :t3 do
  sync :t1
  bass_intro_loop
  #stop
end
live_loop :t4 do
  sync :t1
  #bass_complete_loop
  #stop
end
live_loop :t5 do
  sync :t1
  vocals_loop
  #stop
end
live_loop :transition do
  sync :t1
  cymbal_build
end
live_loop :guitar do
  sync :t1
  #funky_guitar_loop
  #stop
end
live_loop :freddy_loop do
  sync :t1
  sleep 16
  with_fx :reverb do
    #sample dust_final, amp: 0.75
  end
end