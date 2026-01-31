# Dictionary

This directory is for an open source reference and translation dictionary.

This dictionary is specially designed to reduce the work typically required to create/maintain such works, while also improving the flexibility of how it can be used.

## Concepts, Words & Bridges

In the `data` directory we have three kinds of files:

- `concepts`: Abstract concepts independent of natural language.
- `<language>-words`: Words in natural languages but without any semantic definitions, purely textual based.
- `<language>-bridges`: Connects words in languages to concepts, giving semantic definitions.

The concepts should use English primarily to describe it's core semantics and also makes it easier to link words to the concepts as English is the most common 2nd language, thus forming the **bridge**. This means that we get free translation between two non-English languages without any extra work done, which is usually very difficult to find good quality.

We essentially turn traditional multi-language dictionary work from:

$$a_{n} = n^{2} + n \to a_{n} = n $$

As traditionally would need two people (native language on both sides with high ability on target language):

```
# English and Mandarin (2 people)
English <-> Mandarin

# English, Mandarin, and Thai (6 people)
English <-> Thai
English <-> Mandarin
Mandarin <-> Thai

# English, Mandarin, Thai, and Spanish (12 people)
English <-> Thai
English <-> Mandarin
English <-> Spanish
Mandarin <-> Thai
Mandarin <-> Spanish
Thai <-> Spanish

# English, Mandarin, Thai, Spanish and Arabic (20 people)
```

The following provides a visual representation of the bridges:

```mermaid
%%{init: { 'logLevel': 'debug', 'theme': 'default' }}%%
flowchart TD

    tomato -- bridge -- noun:tomato-1
    telephone -- bridge -- noun:phone-1
    phone -- bridge -- noun:phone-1
    phone -- bridge -- verb:phone-1
    西红柿 -- bridge -- noun:tomato-1
    番茄 -- bridge -- noun:tomato-1
    手机 -- bridge -- noun:phone-1
    打电话 -- bridge -- verb:phone-1
    tomate -- bridge -- noun:tomato-1
    jitomate -- bridge -- noun:tomato-1
    teléfono -- bridge -- noun:phone-1
    celular -- bridge -- noun:phone-1
    llamar -- bridge -- verb:phone-1

    subgraph Concepts[Concepts]
        noun:tomato-1
        noun:phone-1
        verb:phone-1
    end

    subgraph English[English]
        tomato
        phone
    end

    subgraph Mandarin[Mandarin]
        西红柿
        番茄
        手机
        打电话
    end

    subgraph Spanish[Spanish]
        tomate
        jitomate
        teléfono
        celular
        llamar
    end
```
