<%@ page contentType="text/html;charset=UTF-8" %><%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1"><title>Your bag — ShopSphere</title>
<style>
body {
    margin: 0;
    background: #f7f7f2;
    color: #17231d;
    font-family: Arial, sans-serif;
}

a {
    color: inherit;
    text-decoration: none;
}

.site-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 20px 5%;
    background: #f7f7f2;
    border-bottom: 1px solid #e4e7de;
}

.hero {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 40px;
    padding: 60px 5%;
}

.hero h1 {
    font-size: 56px;
    line-height: 1.1;
}

.hero-visual img {
    width: 100%;
    height: 450px;
    object-fit: cover;
    border-radius: 16px;
}

.btn-dark {
    display: inline-block;
    background: #17231d;
    color: white;
    padding: 14px 22px;
    border-radius: 8px;
}

@media (max-width: 700px) {
    .hero {
        grid-template-columns: 1fr;
    }

    .hero h1 {
        font-size: 40px;
    }

    .hero-visual img {
        height: 300px;
    }
}
@import url('https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Manrope:wght@400;500;600;700;800&family=Playfair+Display:ital,wght@0,500;0,600;1,500;1,600&display=swap');

:root {
    --ink: #17231d;
    --ink-soft: #314238;
    --muted: #737c73;
    --paper: #f7f7f2;
    --surface: #fff;
    --lime: #d9f078;
    --lime-dark: #b5d44d;
    --line: #e4e7de;
    --serif: 'Playfair Display', Georgia, serif;
    --shadow: 0 18px 45px rgba(24,36,28,.08);
}

* {
    box-sizing: border-box;
}

html {
    scroll-behavior: smooth;
}

body {
    margin: 0;
    background: var(--paper);
    color: var(--ink);
    font-family: 'DM Sans', sans-serif;
    font-size: 14px;
    -webkit-font-smoothing: antialiased;
}

a {
    color: inherit;
    text-decoration: none;
}

button, input, select {
    font: inherit;
}

button, a, input, select {
    -webkit-tap-highlight-color: transparent;
}

button:focus-visible,
a:focus-visible,
input:focus-visible,
select:focus-visible {
    outline: 3px solid #9fbe36;
    outline-offset: 3px;
}

/* Header and navigation */

.site-header {
    height: 78px;
    display: flex;
    align-items: center;
    gap: 30px;
    padding: 0 max(5%, calc((100% - 1320px)/2));
    background: rgba(250,250,246,.93);
    border-bottom: 1px solid rgba(222,226,215,.9);
    position: sticky;
    top: 0;
    z-index: 20;
    backdrop-filter: blur(14px);
}

.brand {
    font: 800 22px Manrope, sans-serif;
    letter-spacing: -1.2px;
    white-space: nowrap;
    display: inline-flex;
    align-items: center;
}

.brand-mark {
    display: inline-grid;
    place-items: center;
    background: var(--lime);
    height: 34px;
    width: 34px;
    border-radius: 12px;
    font-size: 17px;
    margin-right: 9px;
    transform: rotate(-5deg);
}

.brand-dot {
    color: #8ca82d;
}

.main-nav {
    display: flex;
    gap: 25px;
    margin-left: 18px;
}

.main-nav a {
    font-size: 12px;
    font-weight: 600;
    color: #586359;
    transition: color .2s;
}

.main-nav a:hover,
.text-link:hover {
    color: #78951e;
}

.nav-search {
    margin-left: auto;
    width: 230px;
    height: 40px;
    background: #fff;
    border: 1px solid var(--line);
    border-radius: 9px;
    display: flex;
    align-items: center;
    padding: 0 13px;
    gap: 8px;
    transition: border-color .2s;
}

.nav-search:focus-within {
    border-color: #a9c45a;
}

.nav-search span {
    font-size: 22px;
    color: #818a7d;
}

.nav-search input {
    border: 0;
    outline: 0;
    background: transparent;
    width: 100%;
    font-size: 12px;
    min-width: 0;
}

.bag-link {
    font-size: 12px;
    font-weight: 700;
    display: flex;
    align-items: center;
    gap: 8px;
    white-space: nowrap;
}

.bag-count {
    display: grid;
    place-items: center;
    background: var(--lime);
    height: 25px;
    min-width: 25px;
    border-radius: 9px;
    padding: 0 6px;
    font-size: 11px;
}

/* Buttons and typography */

.eyebrow {
    display: flex;
    align-items: center;
    gap: 9px;
    font-size: 9px;
    font-weight: 700;
    letter-spacing: 1.7px;
    color: #687365;
}

.btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 23px;
    padding: 15px 21px;
    border: 0;
    border-radius: 8px;
    font-size: 11px;
    font-weight: 700;
    cursor: pointer;
    transition: transform .2s, background .2s, box-shadow .2s;
}

.btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 9px 20px #18241c18;
}

.btn-dark {
    background: var(--ink);
    color: #fff;
}

.btn-dark:hover {
    background: #304336;
}

.btn span {
    color: var(--lime);
    font-size: 16px;
}

/* Homepage hero */

.hero {
    max-width: 1440px;
    margin: auto;
    display: grid;
    grid-template-columns: 47% 53%;
    min-height: 610px;
    padding: 48px 5.5% 65px;
    gap: 38px;
}

.hero-copy {
    padding: 55px 0 0 3%;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
}

.hero h1,
.page-intro h1,
.success-page h1 {
    font: 500 clamp(50px,5.4vw,78px)/1.04 var(--serif);
    letter-spacing: -2.9px;
    margin: 27px 0 22px;
}

.hero h1 em,
.page-intro h1 em,
.success-page h1 em,
.manifesto p em {
    font-weight: 500;
    color: #829c35;
}

.hero-copy > p,
.page-intro > p {
    max-width: 390px;
    line-height: 1.9;
    color: var(--muted);
    font-size: 13px;
    margin: 0 0 30px;
}

.hero-meta {
    display: flex;
    gap: 38px;
    margin-top: auto;
    padding-top: 42px;
}

.hero-meta div {
    display: flex;
    flex-direction: column;
    gap: 5px;
}

.hero-meta strong {
    font: 700 22px Manrope;
}

.hero-meta span {
    font-size: 8px;
    letter-spacing: 1px;
    color: var(--muted);
}

.hero-visual {
    position: relative;
    min-height: 490px;
    overflow: hidden;
    background: #e5e8dc;
    border-radius: 18px;
    box-shadow: var(--shadow);
}

.hero-visual > img {
    height: 100%;
    width: 100%;
    position: absolute;
    inset: 0;
    object-fit: cover;
    filter: saturate(.75);
}

.hero-visual:after {
    content: '';
    position: absolute;
    inset: 0;
    background: linear-gradient(140deg, transparent 55%, rgba(21,35,26,.16));
}

.floating-note {
    position: absolute;
    z-index: 1;
    bottom: 28px;
    left: 28px;
    background: #fff;
    padding: 14px 17px;
    border-radius: 12px;
    display: flex;
    align-items: center;
    gap: 12px;
    box-shadow: 0 10px 35px #00000015;
}

.note-star {
    display: grid;
    place-items: center;
    background: var(--lime);
    width: 38px;
    height: 38px;
    border-radius: 12px;
    font-size: 22px;
}

.floating-note strong,
.floating-note small {
    display: block;
}

.floating-note strong {
    font-size: 11px;
}

.floating-note small {
    font-size: 10px;
    color: var(--muted);
    margin-top: 4px;
}

.hero-number {
    position: absolute;
    z-index: 1;
    right: 22px;
    top: 22px;
    background: #ffffffdf;
    padding: 10px 12px;
    border-radius: 7px;
    font-size: 9px;
    letter-spacing: 1px;
}

/* Homepage sections and categories */

.section {
    max-width: 1440px;
    margin: auto;
    padding: 60px 6.5% 88px;
}

.section-heading {
    display: flex;
    align-items: flex-end;
    justify-content: space-between;
    margin-bottom: 28px;
}

.section-heading h2 {
    font: 500 39px var(--serif);
    letter-spacing: -1.2px;
    margin: 10px 0 0;
}

.text-link {
    font-size: 11px;
    font-weight: 700;
    border-bottom: 1px solid #b7c18e;
    padding-bottom: 7px;
    transition: color .2s;
}

.category-grid {
    display: grid;
    grid-template-columns: 1.1fr 1fr 1fr;
    gap: 17px;
}

.category-tile {
    height: 320px;
    position: relative;
    overflow: hidden;
    background: #e5e7de;
    padding: 23px;
    border-radius: 13px;
    color: #fff;
    display: flex;
    flex-direction: column;
    justify-content: flex-end;
}

.category-tile:after {
    content: '';
    position: absolute;
    inset: 0;
    background: linear-gradient(0deg, #111a13c9, transparent 68%);
}

.category-tile img {
    position: absolute;
    width: 100%;
    height: 100%;
    object-fit: cover;
    inset: 0;
    transition: transform .55s;
}

.category-tile:hover img {
    transform: scale(1.06);
}

.category-tile span,
.category-tile strong,
.category-tile i {
    z-index: 1;
    position: relative;
}

.category-tile span {
    font-size: 9px;
    letter-spacing: 1.5px;
}

.category-tile strong {
    font: 500 28px var(--serif);
    margin-top: 8px;
}

.category-tile i {
    position: absolute;
    right: 22px;
    bottom: 25px;
    width: 35px;
    height: 35px;
    border-radius: 50%;
    display: grid;
    place-items: center;
    background: #ffffff26;
    font-style: normal;
    font-size: 18px;
    backdrop-filter: blur(5px);
}

.manifesto {
    background: #eaf0dc;
    text-align: center;
    padding: 76px 20px 82px;
}

.manifesto p {
    font: 500 clamp(32px,4.3vw,52px)/1.25 var(--serif);
    letter-spacing: -1.2px;
    margin: 20px 0 22px;
}

/* Footer */

.footer {
    padding: 35px max(5%, calc((100% - 1320px)/2));
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-top: 1px solid var(--line);
    background: #f3f4ec;
}

.footer-brand {
    font-size: 19px;
}

.footer p {
    font-size: 11px;
    color: var(--muted);
    margin: 8px 0 0;
}

.footer-right {
    font-size: 11px;
    color: var(--muted);
    text-align: right;
}

.footer-right span {
    display: block;
    font-size: 9px;
    margin-top: 8px;
}

/* Product listing */

.page-wrap {
    max-width: 1320px;
    margin: auto;
    padding: 48px 5% 90px;
    min-height: 65vh;
}

.page-intro {
    padding: 20px 0 35px;
}

.page-intro h1 {
    font-size: 62px;
    margin: 20px 0 14px;
}

.page-intro > p {
    max-width: 470px;
}

.page-intro.compact {
    padding-bottom: 25px;
}

.page-intro.compact h1 {
    font-size: 55px;
}

.filter-row {
    display: flex;
    align-items: flex-end;
    gap: 14px;
    padding: 22px 0 28px;
    border-top: 1px solid var(--line);
}

.filter-row > div {
    display: flex;
    flex-direction: column;
    gap: 8px;
    flex: 1;
}

.filter-row label,
.field label {
    font-size: 10px;
    font-weight: 700;
    color: #596052;
}

.filter-row input,
.filter-row select,
.field input {
    height: 46px;
    border: 1px solid #dfe2d7;
    background: #fff;
    padding: 0 13px;
    outline: none;
    border-radius: 8px;
    min-width: 0;
    transition: border-color .2s;
}

.filter-row input:focus,
.filter-row select:focus,
.field input:focus {
    border-color: #9fb64c;
}

.filter-row .btn {
    height: 46px;
    white-space: nowrap;
}

.product-heading {
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid var(--line);
    padding: 14px 0;
    margin-bottom: 23px;
    font-size: 11px;
    color: var(--muted);
}

.product-heading strong {
    color: var(--ink);
}

.product-heading > span:last-child {
    font-size: 8px;
    letter-spacing: 1.2px;
}

.product-heading b {
    color: #91a934;
    font-size: 14px;
    margin-left: 7px;
}

.product-grid {
    display: grid;
    grid-template-columns: repeat(4, minmax(0, 1fr));
    gap: 32px 19px;
}

.product-card {
    min-width: 0;
    transition: transform .2s;
}

.product-card:hover {
    transform: translateY(-3px);
}

.product-image {
    height: 270px;
    display: block;
    position: relative;
    overflow: hidden;
    background: #eff0e9;
    border-radius: 12px;
}

.product-image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform .45s;
    mix-blend-mode: multiply;
}

.product-card:hover .product-image img {
    transform: scale(1.045);
}

.discount-badge {
    position: absolute;
    top: 12px;
    left: 12px;
    background: var(--lime);
    padding: 7px 9px;
    border-radius: 6px;
    font-size: 9px;
    font-weight: 700;
}

.image-arrow {
    position: absolute;
    right: 12px;
    bottom: 12px;
    width: 35px;
    height: 35px;
    border-radius: 11px;
    display: grid;
    place-items: center;
    background: #ffffffed;
    font-size: 16px;
    transition: background .2s, transform .2s;
}

.product-card:hover .image-arrow {
    background: var(--lime);
    transform: rotate(45deg);
}

.product-info {
    padding: 15px 2px 0;
}

.product-category {
    font-size: 8px;
    text-transform: uppercase;
    letter-spacing: 1.3px;
    color: #8a9182;
}

.product-info h3 {
    font: 700 14px Manrope;
    margin: 8px 0;
    letter-spacing: -.2px;
}

.description {
    font-size: 10px;
    color: var(--muted);
    line-height: 1.7;
    min-height: 34px;
    margin: 0 0 15px;
}

.product-bottom {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 8px;
    border-top: 1px solid var(--line);
    padding-top: 13px;
}

.product-bottom strong {
    font-size: 13px;
}

.product-bottom del {
    display: inline-block;
    font-size: 10px;
    color: #9a9f93;
    margin-left: 7px;
}

.add-btn {
    border: 1px solid #d5d9c9;
    background: #fff;
    padding: 10px 12px;
    border-radius: 7px;
    font-size: 10px;
    font-weight: 700;
    cursor: pointer;
    transition: background .2s, border-color .2s;
}

.add-btn:hover {
    background: var(--lime);
    border-color: var(--lime);
}

.add-btn:disabled {
    opacity: .5;
    cursor: not-allowed;
}

.empty-state {
    text-align: center;
    padding: 70px 15px 90px;
}

.empty-state > span {
    display: grid;
    place-items: center;
    margin: 0 auto 18px;
    width: 58px;
    height: 58px;
    border-radius: 18px;
    background: var(--lime);
    font-size: 25px;
}

.empty-state h2 {
    font: 500 30px var(--serif);
    margin: 0 0 10px;
}

.empty-state p {
    color: var(--muted);
    font-size: 12px;
    margin-bottom: 23px;
}

/* Cart and checkout */

.cart-layout,
.checkout-layout {
    display: grid;
    grid-template-columns: minmax(0, 1.6fr) minmax(280px, .85fr);
    gap: 45px;
}

.cart-item {
    display: grid;
    grid-template-columns: 125px 1fr auto;
    gap: 20px;
    padding: 22px 0;
    border-bottom: 1px solid var(--line);
}

.cart-item > img {
    width: 125px;
    height: 130px;
    object-fit: cover;
    background: #eceee6;
    border-radius: 10px;
}

.cart-item-info h3 {
    font: 700 15px Manrope;
    margin: 7px 0;
}

.muted {
    font-size: 11px;
    color: var(--muted);
}

.cart-actions {
    display: flex;
    align-items: center;
    gap: 16px;
    margin-top: 14px;
}

.cart-actions form {
    display: flex;
    align-items: center;
    gap: 8px;
}

.cart-actions input {
    width: 58px;
    height: 32px;
    border: 1px solid var(--line);
    padding: 5px 8px;
    border-radius: 6px;
}

.small-link,
.continue-link {
    border: 0;
    background: transparent;
    font-size: 10px;
    text-decoration: underline;
    cursor: pointer;
    padding: 0;
}

.remove-link {
    color: #a45145;
}

.cart-subtotal {
    font-size: 13px;
    white-space: nowrap;
}

.summary-card {
    background: #fff;
    padding: 27px 25px;
    height: max-content;
    border: 1px solid var(--line);
    border-radius: 13px;
    box-shadow: 0 8px 30px #18241c05;
}

.summary-card h2 {
    font: 500 25px var(--serif);
    margin: 12px 0 26px;
}

.summary-line {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 13px 0;
    font-size: 11px;
    border-bottom: 1px solid var(--line);
}

.summary-line strong {
    font-size: 12px;
}

.free {
    color: #7c962b;
}

.total-line {
    border-bottom: 0;
    padding-top: 20px;
    font-size: 13px;
}

.total-line strong {
    font-size: 19px;
}

.summary-note {
    font-size: 10px;
    color: var(--muted);
    line-height: 1.7;
    margin: 8px 0 20px;
}

.full-btn {
    width: 100%;
    margin-top: 10px;
}

.continue-link {
    display: block;
    text-align: center;
    margin-top: 20px;
    text-decoration: none;
    color: var(--muted);
}

.checkout-form {
    background: #fff;
    border: 1px solid var(--line);
    padding: 30px;
    border-radius: 13px;
}

.checkout-form h2 {
    font: 500 23px var(--serif);
    margin: 0 0 23px;
    display: flex;
    justify-content: space-between;
}

.checkout-form h2 span {
    font: 700 10px 'DM Sans';
    color: #8a9c53;
}

.form-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 18px 14px;
}

.field {
    display: flex;
    flex-direction: column;
    gap: 8px;
}

.field.full {
    grid-column: 1 / -1;
}

.field input {
    width: 100%;
}

.payment-heading {
    margin-top: 36px !important;
}

.payment-option {
    display: flex;
    align-items: center;
    gap: 12px;
    border: 1px solid #d8e5ae;
    background: #fbfdf4;
    padding: 15px;
    border-radius: 8px;
}

.payment-option > span {
    flex: 1;
}

.payment-option strong,
.payment-option small {
    display: block;
}

.payment-option strong {
    font-size: 11px;
}

.payment-option small {
    font-size: 10px;
    color: var(--muted);
    margin-top: 5px;
}

.payment-option > b {
    font-size: 9px;
    background: var(--lime);
    padding: 7px;
    border-radius: 5px;
}

.secure-note {
    text-align: center;
    color: var(--muted);
    font-size: 9px;
    line-height: 1.7;
}

.mini-item {
    display: flex;
    align-items: center;
    gap: 12px;
    padding: 12px 0;
    border-bottom: 1px solid var(--line);
}

.mini-item img {
    width: 54px;
    height: 58px;
    object-fit: cover;
    background: #eee;
    border-radius: 7px;
}

.mini-item div {
    flex: 1;
}

.mini-item strong,
.mini-item small {
    display: block;
}

.mini-item strong {
    font-size: 10px;
}

.mini-item small {
    font-size: 9px;
    color: var(--muted);
    margin-top: 5px;
}

.mini-item > b {
    font-size: 10px;
}

.checkout-summary .total-line {
    margin-top: 12px;
}

/* Order success and messages */

.success-page {
    text-align: center;
    min-height: 65vh;
    padding: 80px 20px;
}

.success-icon {
    display: grid;
    place-items: center;
    width: 62px;
    height: 62px;
    border-radius: 20px;
    background: var(--lime);
    margin: 0 auto 25px;
    font-size: 28px;
}

.success-page h1 {
    font-size: 60px;
    margin: 20px 0;
}

.success-page > p {
    max-width: 390px;
    margin: 0 auto 25px;
    color: var(--muted);
    font-size: 12px;
    line-height: 1.8;
}

.order-reference {
    font-size: 9px;
    letter-spacing: 1.5px;
    color: var(--muted);
    margin: 28px 0;
}

.order-reference strong {
    display: block;
    color: var(--ink);
    font-size: 16px;
    letter-spacing: 0;
    margin-top: 8px;
}

.flash {
    padding: 12px max(5%, calc((100% - 1320px)/2));
    font-size: 11px;
}

.flash.success {
    background: #eff7d6;
}

.flash.error {
    background: #fff0eb;
    color: #934332;
}

.flash a {
    font-weight: 700;
    text-decoration: underline;
}

/* Product details page */

.breadcrumbs {
    display: flex;
    gap: 9px;
    align-items: center;
    font-size: 10px;
    color: var(--muted);
    margin: 0 0 30px;
}

.breadcrumbs a {
    color: var(--ink-soft);
}

.breadcrumbs a:hover {
    text-decoration: underline;
}

.detail-layout {
    display: grid;
    grid-template-columns: minmax(0, 1.05fr) minmax(0, .95fr);
    gap: clamp(35px, 6vw, 90px);
    align-items: center;
}

.detail-image {
    height: min(58vw, 610px);
    min-height: 390px;
    position: relative;
    overflow: hidden;
    border-radius: 16px;
    background: #eef0e8;
}

.detail-image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    mix-blend-mode: multiply;
}

.detail-image .discount-badge {
    top: 20px;
    left: 20px;
}

.detail-copy {
    padding: 15px 0;
}

.detail-copy h1 {
    font: 500 clamp(38px, 4.4vw, 59px)/1.08 var(--serif);
    letter-spacing: -1.8px;
    margin: 18px 0 23px;
}

.detail-price {
    display: flex;
    align-items: center;
    gap: 13px;
    flex-wrap: wrap;
}

.detail-price strong {
    font: 700 24px Manrope;
}

.detail-price del {
    font-size: 13px;
    color: #93998e;
}

.saving-label {
    font-size: 9px;
    background: #eaf2d5;
    color: #566b1f;
    padding: 7px 9px;
    border-radius: 5px;
    font-weight: 700;
}

.detail-description {
    font-size: 13px;
    line-height: 1.9;
    color: var(--muted);
    max-width: 470px;
    margin: 25px 0;
}

.stock-status {
    display: flex;
    align-items: center;
    gap: 8px;
    font-size: 10px;
    color: #526c2d;
    margin-bottom: 22px;
}

.stock-dot {
    width: 7px;
    height: 7px;
    background: #8eae3d;
    border-radius: 50%;
    box-shadow: 0 0 0 4px #e7efd5;
}

.detail-add {
    min-width: 230px;
    justify-content: space-between;
}

.detail-perks {
    border-top: 1px solid var(--line);
    margin-top: 30px;
    padding-top: 22px;
    display: grid;
    gap: 18px;
}

.detail-perks > div {
    display: flex;
    gap: 12px;
    align-items: center;
}

.detail-perks > div > span {
    display: grid;
    place-items: center;
    width: 34px;
    height: 34px;
    background: #eaf0dc;
    border-radius: 10px;
    font-size: 15px;
}

.detail-perks strong,
.detail-perks small {
    display: block;
}

.detail-perks strong {
    font-size: 11px;
}

.detail-perks small {
    font-size: 10px;
    color: var(--muted);
    margin-top: 4px;
}

.detail-back {
    padding-top: 50px;
}

/* Responsive layout */

@media (max-width: 1050px) {
    .site-header {
        gap: 18px;
        padding: 0 4%;
    }

    .main-nav {
        gap: 14px;
        margin-left: 4px;
    }

    .nav-search {
        width: 180px;
    }

    .hero {
        padding-left: 4%;
        padding-right: 4%;
    }

    .product-grid {
        grid-template-columns: repeat(3, minmax(0, 1fr));
    }

    .page-wrap,
    .section {
        padding-left: 4%;
        padding-right: 4%;
    }

    .hero h1 {
        font-size: 61px;
    }
}

@media (max-width: 760px) {
    .site-header {
        height: auto;
        min-height: 72px;
        flex-wrap: wrap;
        padding: 14px 5%;
        gap: 14px;
    }

    .brand {
        font-size: 20px;
    }

    .main-nav {
        order: 3;
        width: 100%;
        margin: 0;
        justify-content: space-between;
        padding-top: 3px;
    }

    .nav-search {
        margin-left: auto;
        width: min(42%, 220px);
    }

    .hero {
        grid-template-columns: 1fr;
        padding: 22px 5% 45px;
        gap: 28px;
    }

    .hero-copy {
        padding: 20px 0 0;
    }

    .hero h1 {
        font-size: 58px;
    }

    .hero-meta {
        margin-top: 35px;
    }

    .hero-visual {
        min-height: 360px;
    }

    .section {
        padding: 40px 5% 55px;
    }

    .section-heading h2 {
        font-size: 32px;
    }

    .category-grid {
        grid-template-columns: 1fr 1fr;
    }

    .category-tile {
        height: 250px;
    }

    .category-tile:first-child {
        grid-column: 1 / -1;
    }

    .footer {
        padding: 27px 5%;
    }

    .page-wrap {
        padding: 35px 5% 60px;
    }

    .page-intro h1 {
        font-size: 52px;
    }

    .filter-row {
        flex-wrap: wrap;
    }

    .filter-row > div {
        min-width: 40%;
    }

    .filter-row .btn {
        flex: 1;
    }

    .product-grid {
        grid-template-columns: repeat(2, minmax(0, 1fr));
        gap: 24px 13px;
    }

    .product-image {
        height: 220px;
    }

    .cart-layout,
    .checkout-layout {
        grid-template-columns: 1fr;
        gap: 25px;
    }

    .summary-card {
        order: 2;
    }

    .cart-item {
        grid-template-columns: 90px 1fr auto;
        gap: 12px;
    }

    .cart-item > img {
        width: 90px;
        height: 100px;
    }

    .cart-actions {
        flex-wrap: wrap;
    }

    .checkout-form {
        padding: 22px 17px;
    }

    .success-page h1 {
        font-size: 48px;
    }

    .detail-layout {
        grid-template-columns: 1fr;
        gap: 25px;
    }

    .detail-image {
        height: 420px;
        min-height: 0;
    }

    .detail-copy {
        padding: 5px 0;
    }

    .detail-copy h1 {
        font-size: 44px;
    }

    .detail-add {
        width: 100%;
    }

    .breadcrumbs {
        flex-wrap: wrap;
    }
}

@media (max-width: 420px) {
    .nav-search {
        order: 4;
        width: 100%;
        margin: 0;
    }

    .bag-link {
        margin-left: auto;
    }

    .hero h1 {
        font-size: 50px;
    }

    .hero-visual {
        min-height: 300px;
    }

    .category-grid {
        grid-template-columns: 1fr;
    }

    .category-tile:first-child {
        grid-column: auto;
    }

    .category-tile {
        height: 230px;
    }

    .product-image {
        height: 175px;
    }

    .product-info h3 {
        font-size: 13px;
    }

    .description {
        min-height: 50px;
    }

    .product-bottom {
        align-items: flex-start;
    }

    .add-btn {
        padding: 8px;
    }

    .filter-row > div {
        min-width: 100%;
    }

    .filter-row .btn {
        width: 100%;
    }

    .cart-item {
        grid-template-columns: 78px 1fr;
    }

    .cart-item > img {
        width: 78px;
        height: 85px;
    }

    .cart-subtotal {
        grid-column: 2;
    }

    .cart-actions {
        gap: 10px;
    }

    .form-grid {
        grid-template-columns: 1fr;
    }

    .field.full {
        grid-column: auto;
    }

    .footer {
        align-items: flex-start;
        gap: 20px;
    }

    .footer-right {
        max-width: 125px;
    }

    .detail-image {
        height: 300px;
    }

    .detail-copy h1 {
        font-size: 38px;
    }
}
</style>
</head><body><%@ include file="fragments/header.jsp" %><main class="page-wrap"><div class="page-intro compact"><span class="eyebrow">YOUR PICKS / LOOKING GOOD</span><h1>Your <em>bag.</em></h1><p>A few good things, all in one place.</p></div>
<c:choose><c:when test="${empty cartItems}"><div class="empty-state"><span>✳</span><h2>Your bag is taking a little breather.</h2><p>Find something useful, beautiful, or just very you.</p><a class="btn btn-dark" href="${pageContext.request.contextPath}/products">Explore the shop ↗</a></div></c:when><c:otherwise><div class="cart-layout"><div class="cart-list"><c:forEach var="item" items="${cartItems}"><div class="cart-item"><img src="${item.product.imageUrl}" alt="${item.product.name}"><div class="cart-item-info"><span class="product-category"><c:out value="${item.product.brand}"/></span><h3><c:out value="${item.product.name}"/></h3><span class="muted">₹${item.product.salePrice} each</span><div class="cart-actions"><form action="${pageContext.request.contextPath}/cart" method="post"><input type="hidden" name="action" value="update"><input type="hidden" name="id" value="${item.product.productId}"><input type="hidden" name="back" value="cart"><input aria-label="Quantity" name="quantity" type="number" min="1" max="${item.product.stock}" value="${item.quantity}"><button class="small-link">Update</button></form><form action="${pageContext.request.contextPath}/cart" method="post"><input type="hidden" name="action" value="remove"><input type="hidden" name="id" value="${item.product.productId}"><input type="hidden" name="back" value="cart"><button class="small-link remove-link">Remove</button></form></div></div><strong class="cart-subtotal">₹${item.subtotal}</strong></div></c:forEach></div><aside class="summary-card"><span class="eyebrow">THE NUMBERS</span><h2>Order summary</h2><div class="summary-line"><span>Subtotal</span><strong>₹${cartTotal}</strong></div><div class="summary-line"><span>Delivery</span><strong class="free">FREE</strong></div><div class="summary-line total-line"><span>Total</span><strong>₹${cartTotal}</strong></div><p class="summary-note">Delivery details come next. No payment is collected online in this demo.</p><a class="btn btn-dark full-btn" href="${pageContext.request.contextPath}/checkout">Continue to checkout ↗</a><a class="continue-link" href="${pageContext.request.contextPath}/products">← Keep exploring</a></aside></div></c:otherwise></c:choose></main><%@ include file="fragments/footer.jsp" %></body></html>
