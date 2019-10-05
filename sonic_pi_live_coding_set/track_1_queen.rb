use_synth :fm
use_bpm 110

#here are all my samples
clap = "C:/Users/emarintsch.DAVINCISCHOOLS/Google Drive/CS Pathway 2017-18/Sonic Pi Live Coding/Sonic Pi Setlist/Another One Bites the Dust/samples/clap.wav"
happy = "C:/Users/emarintsch.DAVINCISCHOOLS/Google Drive/CS Pathway 2017-18/Sonic Pi Live Coding/Sonic Pi Setlist/Another One Bites the Dust/samples/are_you_happy.wav"
funk = "C:/Users/emarintsch.DAVINCISCHOOLS/Google Drive/CS Pathway 2017-18/Sonic Pi Live Coding/Sonic Pi Setlist/Another One Bites the Dust/samples/funky_guitar_riff.wav"
intro1 = "C:/Users/emarintsch.DAVINCISCHOOLS/Google Drive/CS Pathway 2017-18/Sonic Pi Live Coding/Sonic Pi Setlist/Another One Bites the Dust/samples/intro_1.wav"
intro2 = "C:/Users/emarintsch.DAVINCISCHOOLS/Google Drive/CS Pathway 2017-18/Sonic Pi Live Coding/Sonic Pi Setlist/Another One Bites the Dust/samples/intro_2.wav"
dust1 = "C:/Users/emarintsch.DAVINCISCHOOLS/Google Drive/CS Pathway 2017-18/Sonic Pi Live Coding/Sonic Pi Setlist/Another One Bites the Dust/samples/bites_the_dust.wav"
dust2 = "C:/Users/emarintsch.DAVINCISCHOOLS/Google Drive/CS Pathway 2017-18/Sonic Pi Live Coding/Sonic Pi Setlist/Another One Bites the Dust/samples/bites_the_dust_2.wav"
dust3 = "C:/Users/emarintsch.DAVINCISCHOOLS/Google Drive/CS Pathway 2017-18/Sonic Pi Live Coding/Sonic Pi Setlist/Another One Bites the Dust/samples/bites_the_dust_heyhey.wav"
dust_final = "C:/Users/emarintsch.DAVINCISCHOOLS/Google Drive/CS Pathway 2017-18/Sonic Pi Live Coding/Sonic Pi Setlist/Another One Bites the Dust/samples/bites_the_dust_final.wav"
#here's an array with all the vocal samples
freddy = [intro1, intro2, dust1, dust2, dust3, dust3]

#DEFINE ALL YOUR TRACKS AS FUNCTIONS
define :cymbal_intro do
  x = 0.0625
  #first 4 measures
  16.times do
    sample :drum_cymbal_closed, amp: x
    sleep 1
    x = x + 0.05859375 #(1-0.0625)/16
  end
end

define :cymbal do
  16.times do
    sample :drum_cymbal_closed
    sleep 1
  end
end

define :bass_intro_only do
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

define :claps do
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
  print "complete" #this prints to the LOG and allows me to see when this loop finishes
end

define :bass_intro_full do
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

define :funky_guitar do
  3.times do
    2.times do
      sample funk
      sleep 8
    end
  end
  sleep 16
end

define :vocals do
  i = 0 #change to i=2 if you don't want the two intro vocal samples
  6.times do
    sleep 12
    sample freddy[i], amp: 0.75
    sleep 4
    i += 1
  end
end


#PLAY YOUR TRACKS BY CALLING YOUR FUNCTIONS HERE
cymbal_intro

live_loop :track1 do
  claps
end
live_loop :track2 do
  sync :track1
  cymbal
end
live_loop :track3 do
  sync :track1
  bass_intro_only
end

live_loop :track4 do
  sync :track1
  #bass_intro_full
end
live_loop :track5 do
  sync :track1
  #vocals
end
live_loop :transition do
  sync :track1
  #cymbal_build
end

live_loop :guitar do
  sync :track1
  #funky_guitar
end
live_loop :vocal_track do
  sync :track1
  sleep 16
  with_fx :reverb do
    #sample dust_final, amp: 0.75
  end
end

=begin
live_loop :track1 do
  stop
end
live_loop :track2 do
  stop
end
live_loop :track3 do
  stop
end
live_loop :track4 do
  stop
end
live_loop :track5 do
  stop
end
live_loop :transition do
  stop
end
live_loop :guitar do
  stop
end
live_loop :vocal_track do
  stop
end
=end