use_bpm 140 # https://findsongtempo.com/artists/kendrick-lamar-9186fd9b-addf-461f-a51f-16f29a2b6dd9/songs/dna-fbbf4ba7-f250-4e01-8a15-d2c71e71896e

igot = "C:/Users/emarintsch.DAVINCISCHOOLS/Google Drive/CS Pathway 2017-18/Sonic Pi Live Coding/Sonic Pi Setlist/DNA/samples/I_GOT.ogg"
#print sample_duration igot
yousa = "C:/Users/emarintsch.DAVINCISCHOOLS/Google Drive/CS Pathway 2017-18/Sonic Pi Live Coding/Sonic Pi Setlist/DNA/samples/YOUS_A.wav"
#print sample_duration yousa
load_samples [igot, yousa]

s = :drum_bass_hard
bass_notes = [:b2, :b2, :b2, :g2, :g2, :g2]
kick_sample = [s, s, s, s, s, s]
bass_duration = [1.5, 1.5, 1.5, 0.5, 1, 2]

hi_notes = [:b3, :a3, :b3, :c, :e, :a3]
hi_duration = [4, 1, 1, 0.75, 0.25, 1]
hi_sustain = [2, 1, 0.5, 0.1, 0.5]

counter = 0 #used to start/stop live_live loops
a = 2 #used to bass boost song by changing amplitude of all live_loops
b = 0.25

define :songrhythm do |list1, list2, list3, amplitude, note_or_sample| #if the 'sleep' is identical to the 'sustain' then list2 = list3
  i = 0
  if note_or_sample == "n"
    while (i < list1.length)
      play list1[i], amp: amplitude, sustain: list3[i]
      sleep list2[i]
      i += 1
    end
  elsif note_or_sample == "s"
    while (i < list1.length)
      sample list1[i], amp: amplitude, sustain: list3[i]
      sleep list2[i]
      i += 1
    end
  else
    print "Please specify whether you are using a note or sample in the function!"
  end
end

4.times do
  sample igot
  sleep 1
end

2.times do
  songrhythm kick_sample, bass_duration, bass_duration, 2, "s"
end

live_loop :DNA do
  counter += 1
  print counter
  
  live_loop :kickdrum do
    2.times do
      songrhythm kick_sample, bass_duration, bass_duration, a, "s"
    end
  end
  
  if counter > 0
    live_loop :bassline do
      use_synth :fm
      songrhythm bass_notes, bass_duration, bass_duration, a, "n"
    end
  end
  
  if counter > 1
    live_loop :synth do
      with_fx :reverb do
        use_synth :chipbass
        songrhythm hi_notes, hi_duration, hi_sustain, b, "n"
      end
    end
  end
  
  if counter > 2
    live_loop :yous_a do
      sleep 4.5
      sample yousa
      sleep 3.5
    end
  end
  
  if counter > 4
    live_loop :drums do
      sample :loop_tabla, finish: 0.5, beat_stretch: 8, amp: a
      sleep 4
    end
  end
  
  if counter == 4
    live_loop :bassline do
      stop
    end
    live_loop :synth do
      stop
    end
    live_loop :yous_a do
      stop
    end
    live_loop :drums do
      stop
    end
  end
  
  if counter == 9
    live_loop :kickdrum do
      stop
    end
    live_loop :bassline do
      stop
    end
    live_loop :synth do
      stop
    end
    live_loop :yous_a do
      stop
    end
    live_loop :drums do
      stop
    end
    a = 200
    s = :bd_boom
  end
  
  if counter >= 13
    live_loop :kickdrum do
      stop
    end
    live_loop :bassline do
      stop
    end
    live_loop :synth do
      stop
    end
    live_loop :yous_a do
      stop
    end
    live_loop :drums do
      stop
    end
  end
  
  sleep 8
end

