# Промпты для 3D-объектов · голубой #42B6F5

Nano Banana. Только под тёмную тему. Объекты светлые, свечение голубое.

Растяжка: `#97D7FA` · `#6CC6F7` · **`#42B6F5`** · `#338EBF` · `#246487` · `#153A4E`

Во всех промптах цвет задан **и кодом, и словами**: `light blue (#42B6F5), a clear
soft sky blue, not cyan, not turquoise, not deep blue`. По одному хекс-коду модели
попадают в оттенок нестабильно, словесное описание страхует.

---

## Почему объект светлый, а не чёрный

Фон почти чёрный. Чёрный объект на нём превращается в дыру: силуэт не читается,
сколько ни настраивай свечение. Корпус — белая матовая керамика, чёрный работает фоном.

Если нужен тёмный корпус, замените `matte white ceramic` на `deeply matte
graphite-black` и усильте контровой: `strong light-blue rim light along the entire
silhouette`. Сначала сгенерируйте один объект и приложите к фону — сразу станет видно.

---

## Как генерировать

1. Начать со слайда 1, довести до нужного вида — это эталон материала и света
2. Дальше к каждому промпту **прикладывать первую картинку как референс**:
   `Match the material, lighting, surface finish and exact blue tone of the reference image.`
3. Без референса объекты разъедутся по фактуре, даже при одинаковом тексте

Если модель дорисовывает текст — перегенерировать, не править.

---

## 1. Титул · узел связей

```
Several matte white ceramic faceted modules floating in orbit around a common empty center, connected by thin taut light-blue light filaments. The modules are angular, precisely machined, slightly different sizes. Product render, three-quarter view, floating in empty space. The glow colour is light blue (#42B6F5), a clear soft sky blue, not cyan, not turquoise, not deep blue, confined to the filaments and to narrow seams on the module edges only, thin restrained light lines, no neon bloom, no colored haze. Soft light-blue rim light tracing the silhouettes to separate it from the background. Single soft key light from upper left, faint cool fill. Pure black background, no ground plane, no cast shadow. No text, no logos, no letters. Centered composition with margin, clean minimal studio render, high detail, square 1:1.
```

## 2. Проблематика · запертый свет

```
A dense tangled knot of matte white cables, coiled tightly and chaotically into a single mass. Light-blue glow burns deep inside the knot and escapes only through narrow gaps between the cables — the light is clearly trapped, it does not spill outward. Product render, three-quarter view, floating in empty space. The glow colour is light blue (#42B6F5), a clear soft sky blue, not cyan, not turquoise, not deep blue, confined to the interior gaps only, thin restrained shafts, thin restrained light lines, no neon bloom, no colored haze. Soft light-blue rim light tracing the outer silhouette to separate it from the background. Single soft key light from upper left, faint cool fill. Pure black background, no ground plane, no cast shadow. No text, no logos, no letters. Centered composition with margin, clean minimal studio render, high detail, square 1:1.
```

## 3. Что предлагаем · сборка из осколков

```
Scattered matte white ceramic angular shards drawn inward toward a center, assembling into one coherent solid form. Some shards are already locked in place, others still approaching with visible gaps. Light-blue glow runs along the joint lines where the pieces meet. Product render, three-quarter view, floating in empty space. The glow colour is light blue (#42B6F5), a clear soft sky blue, not cyan, not turquoise, not deep blue, confined to the seams between shards only, thin restrained light lines, no neon bloom, no colored haze. Soft light-blue rim light tracing the silhouette to separate it from the background. Single soft key light from upper left, faint cool fill. Pure black background, no ground plane, no cast shadow. No text, no logos, no letters. Centered composition with margin, clean minimal studio render, high detail, square 1:1.
```

## 4. Демонстрация · парящие пластины

Тонкие, гладкие, без портов и связей — иначе спутается с архитектурой.

```
Three thin matte white ceramic rectangular plates floating one above another, each offset horizontally from the one below, forming a staggered stack. The plates are smooth and featureless, with rounded corners and clean edges. Their thin side edges glow light blue. Product render, three-quarter view, floating in empty space. The glow colour is light blue (#42B6F5), a clear soft sky blue, not cyan, not turquoise, not deep blue, confined to the plate edges only, no glow on the flat faces, thin restrained light lines, no neon bloom, no colored haze. Soft light-blue rim light tracing the silhouette to separate it from the background. Single soft key light from upper left, faint cool fill. Pure black background, no ground plane, no cast shadow. No text, no logos, no letters, no screen content. Centered composition with margin, clean minimal studio render, high detail, square 1:1.
```

## 5. Путь пользователя · дорожка с узлами

```
A matte white ceramic ribbon path curving away into depth and rising upward, with four raised node points spaced along it. Each node is lit light blue from within, and the light grows progressively stronger from the first node to the fourth. Product render, three-quarter view, floating in empty space. The glow colour is light blue (#42B6F5), a clear soft sky blue, not cyan, not turquoise, not deep blue, confined to the four nodes and a thin line running along the center of the ribbon, thin restrained light lines, no neon bloom, no colored haze. Soft light-blue rim light tracing the silhouette to separate it from the background. Single soft key light from upper left, faint cool fill. Pure black background, no ground plane, no cast shadow. No text, no logos, no letters, no numbers. Centered composition with margin, clean minimal studio render, high detail, square 1:1.
```

## 6. Почему именно мы · ключ

```
A matte white ceramic plate with an irregular contoured cutout, and a separate matte white element shaped to fit that cutout exactly, hovering just before it, aligned and about to enter. Light-blue glow traces the matching contour where the two shapes correspond. Product render, three-quarter view, floating in empty space. The glow colour is light blue (#42B6F5), a clear soft sky blue, not cyan, not turquoise, not deep blue, confined to the contour line of the fit only, a thin restrained outline, thin restrained light lines, no neon bloom, no colored haze. Soft light-blue rim light tracing the silhouettes to separate it from the background. Single soft key light from upper left, faint cool fill. Pure black background, no ground plane, no cast shadow. No text, no logos, no letters. Centered composition with margin, clean minimal studio render, high detail, square 1:1.
```

## 7. Эффект для заказчика · песочные часы

```
An hourglass with a matte white ceramic frame and clear glass bulbs. Instead of sand, a glowing light-blue stream falls through the neck. In the upper bulb the substance is loose and formless; in the lower bulb it has settled into a neat ordered crystalline stack with clean geometric edges. Product render, three-quarter view, floating in empty space. The glow colour is light blue (#42B6F5), a clear soft sky blue, not cyan, not turquoise, not deep blue, confined to the falling stream and the crystalline stack inside the glass, thin restrained light lines, no neon bloom, no colored haze. Soft light-blue rim light tracing the frame silhouette to separate it from the background. Single soft key light from upper left, faint cool fill. Pure black background, no ground plane, no cast shadow. No text, no logos, no letters, no numbers. Centered composition with margin, clean minimal studio render, high detail, square 1:1.
```

## 9. Спасибо за внимание · росток

```
A compact matte white ceramic base form, smooth and closed, from which a single thin light-blue line of light rises upward and branches into several finer lines near the top. The base is solid and grounded, the light is delicate. Product render, three-quarter view, floating in empty space. The glow colour is light blue (#42B6F5), a clear soft sky blue, not cyan, not turquoise, not deep blue, confined to the rising line and its branches only, thin restrained light lines, no neon bloom, no colored haze. Soft light-blue rim light tracing the base silhouette to separate it from the background. Single soft key light from upper left, faint cool fill. Pure black background, no ground plane, no cast shadow. No text, no logos, no letters, no plant leaves. Centered composition with margin, clean minimal studio render, high detail, square 1:1.
```

## Н. Архитектура · многослойная плата

Толще пластин со слайда 4, с портами по краям и вертикальными связями между слоями.

```
Three matte white ceramic circuit board layers floating one above another with a horizontal offset, forming a staggered stack. Each board has a thickness, connector ports along its edges and a subtle etched surface texture. Thin vertical light-blue connections run between the layers, linking them. Product render, three-quarter view, floating in empty space. The glow colour is light blue (#42B6F5), a clear soft sky blue, not cyan, not turquoise, not deep blue, confined to the vertical inter-layer connections and to fine traces on the board surfaces, thin restrained light lines, no neon bloom, no colored haze. Soft light-blue rim light tracing the silhouette to separate it from the background. Single soft key light from upper left, faint cool fill. Pure black background, no ground plane, no cast shadow. No text, no logos, no letters, no component labels. Centered composition with margin, clean minimal studio render, high detail, square 1:1.
```

---

## Если результат не тот

| Проблема | Что дописать |
|---|---|
| Ушло в бирюзу | `pure light blue like a clear daytime sky, zero green in the hue` |
| Ушло в тёмно-синий | `light airy blue, not navy, not royal blue, not electric blue` |
| Слишком неоново | `no neon bloom, no colored haze, light strictly inside seams` |
| Голубого слишком много | `blue covers less than 15% of the object surface` |
| Объект блестящий | заменить `matte` на `deeply matte, powder-coated finish` |
| Сливается с фоном | `strong light-blue rim light along the entire silhouette` |
| Появился текст | `absolutely no text, no signage, no UI elements` |
| Упирается в края кадра | `object occupies 60% of the frame, generous empty margin` |
| Фактура разная между слайдами | прикладывать референс, без него набор не собрать |
