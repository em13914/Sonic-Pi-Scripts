splash = "C:/Users/emarintsch.DAVINCISCHOOLS/Google Drive/CS Pathway 2017-18/Sonic Pi Live Coding/Sonic Pi Setlist/Emoji A Chain/samples/splash.wav"
splash2 = "C:/Users/emarintsch.DAVINCISCHOOLS/Google Drive/CS Pathway 2017-18/Sonic Pi Live Coding/Sonic Pi Setlist/Emoji A Chain/samples/splash_2.wav"
migos = "C:/Users/emarintsch.DAVINCISCHOOLS/Google Drive/CS Pathway 2017-18/Sonic Pi Live Coding/Sonic Pi Setlist/Emoji A Chain/samples/migos.wav"
emoji = "C:/Users/emarintsch.DAVINCISCHOOLS/Google Drive/CS Pathway 2017-18/Sonic Pi Live Coding/Sonic Pi Setlist/Emoji A Chain/samples/emoji_long.wav"
banger = "C:/Users/emarintsch.DAVINCISCHOOLS/Google Drive/CS Pathway 2017-18/Sonic Pi Live Coding/Sonic Pi Setlist/Emoji A Chain/samples/this_is_a_banger.wav"
splash_wait = sample_duration splash
a1 = 1
a2 = 0.5

# DEFINE your function...
define :migos do |sample1, sample2, sample3|
  sample sample1, amp: a1
  sleep 2.45
  sample sample2, amp: a1
  sleep splash_wait
  sample sample3, amp: a1
  sleep (1.05-splash_wait)
end

# CALL your function!
live_loop :track1 do
  5.times do
    migos migos, splash, splash2
    if a1 > 0.2
      a1 = a1 - 0.2
    else
      a1 = a1 - 0.1
    end
  end
  sample migos, amp: 0.1
  stop
end

live_loop :track2 do
  5.times do
    sample emoji, beat_stretch: 3.5, amp: a2
    sleep 3.5
    a2 = a2 - 0.1
  end
  stop
end

sleep 17.5
with_fx :reverb do
  sample banger, amp: 2
  sleep sample_duration banger
end