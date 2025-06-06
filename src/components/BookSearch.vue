<template>
    <div class="book-search">
        <h2>📚 書籍查詢</h2>
        <div class="search-bar">
            <input v-model="query" placeholder="請輸入書名關鍵字" @keyup.enter="searchBooks" />
            <button @click="searchBooks" :disabled="loading">
                {{ loading ? "查詢中..." : "查詢" }}
            </button>
        </div>

        <p class="error" v-if="error">{{ error }}</p>
        <p class="no-results" v-else-if="!books.length && !loading">無查詢結果</p>

        <div class="book-list" v-if="books.length">
            <div class="book-card" v-for="book in books" :key="book.id">
                <h3>{{ book.title }}</h3>
                <p class="genre">{{ book.genre }}</p>
                <p>作者：{{ book.author }}</p>
                <p>出版年份：{{ book.year }}</p>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref } from "vue";

const query = ref("");
const books = ref([]);
const loading = ref(false);
const error = ref(null);

async function searchBooks() {
    if (!query.value.trim()) {
        error.value = "請輸入查詢關鍵字";
        books.value = [];
        return;
    }
    loading.value = true;
    error.value = null;

    try {
        const response = await fetch(`http://localhost:8000/books?title=${encodeURIComponent(query.value)}`);
        if (!response.ok) {
            throw new Error(`HTTP錯誤: ${response.status}`);
        }
        const data = await response.json();
        books.value = data.books || [];
    } catch (err) {
        error.value = `查詢失敗：${err.message}`;
        books.value = [];
    } finally {
        loading.value = false;
    }
}
</script>

<style scoped>
.book-search {
    max-width: 800px;
    width: 500px;
    margin: 40px auto;
    font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
    padding: 20px;
    background-color: #f9fafb;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

h2 {
    text-align: center;
    margin-bottom: 20px;
    color: #374151;
}

.search-bar {
    display: flex;
    justify-content: center;
    margin-bottom: 20px;
}

input {
    flex: 1;
    max-width: 400px;
    padding: 10px 12px;
    font-size: 16px;
    border: 1px solid #d1d5db;
    border-radius: 8px 0 0 8px;
    outline: none;
    transition: 0.3s;
}

input:focus {
    border-color: #2563eb;
    box-shadow: 0 0 0 2px #93c5fd;
}

button {
    padding: 10px 20px;
    font-size: 16px;
    background-color: #2563eb;
    color: white;
    border: none;
    border-radius: 0 8px 8px 0;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

button:hover {
    background-color: #1d4ed8;
}

button:disabled {
    background-color: #9ca3af;
    cursor: not-allowed;
}

.error {
    color: #dc2626;
    text-align: center;
    margin-top: 10px;
    font-weight: bold;
}

.no-results {
    text-align: center;
    color: #6b7280;
    margin-top: 20px;
}

.book-list {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
    gap: 20px;
    margin-top: 20px;
}

.book-card {
    background-color: #ffffff;
    border: 1px solid #e5e7eb;
    padding: 15px;
    border-radius: 10px;
    transition: box-shadow 0.3s ease;
    text-align: left;
}

.book-card:hover {
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
}

.book-card h3 {
    font-size: 18px;
    margin-bottom: 6px;
    color: #111827;
    text-wrap: pretty;
}

.book-card p {
    margin: 4px 0;
    color: #4b5563;
}

.book-card .genre {
    margin: 4px 0;
    font-size: 0.8rem;
    color: #c74e54;
}
</style>
