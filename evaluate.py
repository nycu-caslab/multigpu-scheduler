def main():
    s = list()
    e = list()
    while True:
        try:
            start, end= tuple(map(int, input().split()))[:2]
            s.append(start)
            e.append(end)
            s.sort()
            e.sort()
        except EOFError:
            print(f"Start: {s[0]}, End: {e[-1]}, Latency: {e[-1] - s[0]}")
            break

if __name__ == "__main__":
    main()
