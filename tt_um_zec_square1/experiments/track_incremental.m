% Copyright (c) 2024 Zachary Catlin
% SPDX-License-Identifier: Apache-2.0

function track_incremental (rate, start_r, end_r, duration, chip_samples, fname)
  % a test of piecewise synthesis

  sin_tbl = sin((1/4096) * 2 * pi * (0:4095));

  N = floor(duration * rate);
  samp = zeros(1, N); % the actual samples

  phase = 0; % phase accumulator
  x = 0.5;

  for i = 1:20
    x = start_r * x * (1 - x);
  endfor

  increment = (end_r - start_r) / N;

  c = 1 / rate;
  freq = (200 + 1000 * x) * c;

  for i = 1:N
    samp(i) = sin_tbl(uint64(1 + floor(4096 * phase)));
    phase = phase + freq;
    phase = phase - floor(phase);

    if (mod(i, chip_samples) == 0)
      r = start_r + increment * i;
      x = r * x * (1 - x);
      freq = (200 + 1000 * x) * c;
    endif
  endfor

  summary = sprintf('track_incremental %d %f %f %d %d %s', rate, start_r, end_r, duration, chip_samples, fname);
  save -text -append 'log.txt' summary;
  audiowrite(fname, samp, rate);
endfunction
