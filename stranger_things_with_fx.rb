# Stranger Things Main Theme
# NOTE: Each measure's total sleep adds up to 4 because the time signature is 4/4
use_bpm 160
use_synth :saw

live_loop :main_theme do
  with_fx :distortion do
    # First set of eighth notes
    play :c2
    sleep 0.5
    play :e2
    sleep 0.5
    play :g2
    sleep 0.5
    play :b2
    sleep 0.5
    
    # Second set of eigth notes
    play :c3
    sleep 0.5
    play :b2
    sleep 0.5
    play :g2
    sleep 0.5
    play :e2
    sleep 0.5
  end
end

live_loop :drums do
  sleep 2
  sample :bd_808, amp: 100
  sleep 3.5
  sample :bd_808, amp: 100, sustain: 0.25
  sleep 0.5
  sample :bd_808, amp: 100
  sleep 2
end