% Copyright (c) 2024 Zachary Catlin
% SPDX-License-Identifier: Apache-2.0

function track_square (rate, duration, start_r, end_r, num_oscillators, replacement_interval, fname)
  % attempt to fake a Fourier-like synthesis using an ensemble of square-wave oscillators

  N = floor(duration * rate);
  samp = zeros(1, N); % the actual samples
  interval_r = (end_r - start_r) / N;

  phases = zeros(1, num_oscillators); % per-oscillator phase accumulators
  freqs = zeros(1, num_oscillators);  % per-oscillator frequencies
  next_to_replace = 1;

  c = 1 / rate;
  inv_no = 1 / num_oscillators;

  x = 0.5;
  r = start_r;
  
  for i = 1:5
    x = r * x * (1 - x);
  endfor

  freqs(:) = c * (200 + 1000 * x);

  x = 0.5;
  for i = 1:N
    phases = phases + freqs;
    phases = phases - floor(phases);
    samp(i) = inv_no * sum(2 * (phases < 0.5) - 1); % sum of square waves

    if (mod(i, replacement_interval) == 0)
      r = start_r + interval_r * i;
      x = r * x * (1 - x);
      freqs(next_to_replace) = c * (200 + 100 * x);

      next_to_replace = next_to_replace + 1;
      if (next_to_replace > num_oscillators)
        next_to_replace = 1;
      endif
    endif
  endfor

  summary = sprintf('track_square %d %d %f %f %d %d %s', rate, duration, start_r, end_r, num_oscillators, replacement_interval, fname);
  save -text -append 'log.txt' summary;
  audiowrite(fname, samp, rate);
endfunction
